class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能

  has_one :clinic, dependent: :nullify
  has_one :address, dependent: :destroy
  has_many :published_cards, class_name: "ClinicCard", foreign_key: "publisher_id"
  has_many :holders, through: :published_cards
  has_many :held_cards, class_name: "ClinicCard", foreign_key: "holder_id"
  has_many :publishers, through: :held_cards
  accepts_nested_attributes_for :address, allow_destroy: true
  has_many :notices, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :last_name, length: { maximum: 20}
  validates :first_name, length: { maximum: 20}
  validates :phone, length: { maximum: 12 }
  validates :email, length: { maximum: 30 }, uniqueness: true
  
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  # override Devise::Models::Confirmable#send_on_create_confirmation_instructions
  def send_on_create_confirmation_instructions
    gengerate_confirmation_token! unless @raw_confirmation_token
    send_devise_notification(:confirmation_on_create_instructions, @raw_confirmation_token, {})
  end

  def crop_photo(url, x, y, w, h)
    avatar =  Magick::Avatar.new
    urlimage = open(url)
    image.from_blob(urlimage.read)
    crop = image.crop(x,y,w,h)
    crop.write('pool_cropped.jpg')
  end

  def full_name
    "#{last_name} #{first_name}"
  end


  class << self
    def search(query)
      rel = order("last_name")
      if query.present?
        rel = rel.where("last_name LIKE ? OR first_name LIKE ?",
          "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
