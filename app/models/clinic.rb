class Clinic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :patients, through: :coupons

  validates :user, length: { maximum: 20 }
end
