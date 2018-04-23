class Patient < ApplicationRecord
  belongs_to :user, optional: true
  has_many :coupons
  has_many :clinics, through: :coupons
  has_many :clinic_cards
  has_many :clinics, through: :clinic_cards

  validates :holding_point, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
