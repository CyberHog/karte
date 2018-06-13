class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能

  has_one :clinic, dependent: :nullify
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true
  # 診察券
  has_many :published_cards, class_name: "ClinicCard", foreign_key: "publisher_id"
  has_many :holders, through: :published_cards
  has_many :held_cards, class_name: "ClinicCard", foreign_key: "holder_id"
  has_many :publishers, through: :held_cards
  # 会計
  has_many :issued_receipts, class_name: "PatientsReceipt", foreign_key: "seller_id"
  has_many :buyers, through: :issued_receipts
  has_many :received_receipts, class_name: "PatientsReceipt", foreign_key: "buyer_id"
  has_many :sellers, through: :received_receipts
  # カルテ
  has_many :completed_charts, class_name: "MedicalChart", foreign_key: "therapist_id"
  has_many :patients, through: :completed_charts
  has_many :received_charts, class_name: "MedicalChart", foreign_key: "patient_id"
  has_many :therapists, through: :received_charts
  # クーポン
  has_many :issued_coupons, class_name: "Coupon", foreign_key: "seller_id"
  has_many :buyers, through: :issued_coupons
  has_many :received_coupons, class_name: "Coupon", foreign_key: "buyer_id"
  has_many :sellers, through: :received_coupons

  has_many :clinic_cards
  has_many :patients_receipts, through: :clinic_cards
  has_many :menus, dependent: :nullify
  has_many :staffs, dependent: :nullify
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
        rel = rel.where("last_name LIKE ? OR first_name LIKE ? OR phone LIKE ?",
          "%#{query}%", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
