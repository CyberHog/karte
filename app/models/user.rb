class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  has_one :patient, dependent: :nullify
  has_one :clinic, dependent: :nullify
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  has_many :notices, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :last_name, length: { maximum: 20}
  validates :first_name, length: { maximum: 20}
  validates :phone, length: { maximum: 12 }
  validates :email, length: { maximum: 30 }, uniqueness: true
  
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

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
