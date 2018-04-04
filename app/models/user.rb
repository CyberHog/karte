class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  has_many :notices, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :user_name, presence: true,
    format: { with: /\A[A-Za-z0-9]\w*\z/, allow_blank: true,
          message: :invalid_user_name },
    length: { maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
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
      rel = order("user_mame")
      if query.present?
        rel = rel.where("user_name LIKE ? OR full_name LIKE ?",
          "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
