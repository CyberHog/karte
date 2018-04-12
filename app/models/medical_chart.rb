class MedicalChart < ApplicationRecord
  has_many :clinics, through: :receipts, dependent: :nullify
  has_many :menus
  has_many :staffs
  has_many :receipts
  

  validates :cc, :tx_comment, :comment, :visited_at, presence: true
  validates :cc, length: { maximum: 200 }
end
