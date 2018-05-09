class Clinic < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id", optional: true
  has_many :clinic_cards, dependent: :nullify
  has_many :patients, through: :clinic_cards
  has_many :menus, dependent: :nullify

  validates :name, length: { maximum: 20 }
  validates :hp_url, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true,
    length: { maximum: 50, allow_blank: true }
end
