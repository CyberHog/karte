class Clinic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :patients, through: :coupons
  has_many :medical_charts, thorough: :receipts
  accepts_nested_attributes_for :receipts

  validates :user, length: { maximum: 20 }
end
