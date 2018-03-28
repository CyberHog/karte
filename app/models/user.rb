class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   has_one :image, class_name: "UserImage", dependent: :destroy
   accepts_nested_attributes_for :image, allow_destroy: true
  
  validates :user_id, presence: true,
    format: { with: /\A[A-Za-z0-9]\w*\z/, allow_blank: true,
          message: :invalid_user_name },
    length: { maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :last_name, length: { maximum: 20}
  validates :first_name, length: { maximum: 20}
  validates :phone, length: { maximum: 12 }
  validates :email, length: { maximum: 30 }, uniqueness: true
  validates :username, uniqueness: { case_sensitive: :false },
            length: { minimum: 4, maximum: 20 },
            format: { with: /\A[A-Za-z0-9]\w*\z/, allow_blank: true,
            message: :invalid_user_name }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :authentication_keys => [:login]

  attr_accessor :login

  # override Devise::Models::Confirmable#send_on_create_confirmation_instructions
  def send_on_create_confirmation_instructions
    gengerate_confirmation_token! unless @raw_confirmation_token
    send_devise_notification(:confirmation_on_create_instructions, @raw_confirmation_token, {})
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["user_id = :value OR username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  def full_name
    "#{last_name} #{first_name}"
  end
end
