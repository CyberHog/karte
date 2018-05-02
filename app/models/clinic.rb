class Clinic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :clinic_cards
  has_many :patients, through: :clinic_cards
  has_many :menus

  validates :name, length: { maximum: 20 }
  validates :hp_rul,
    format: { with: /\A[A-Za-z0-9]\w*\z/, allow_blank: true,
          message: :invalid_hp_url },
    length: { maximum: 20, allow_blank: true }
end
