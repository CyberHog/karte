class MedicalChart < ApplicationRecord
  has_many :clinics, through: :receipts, dependent: :nullify
  has_many :receipts
  accepts_nested_attributes_for :receipts
  

  validates :cc, :tx_comment, :comment, :visited_at, presence: true
  validates :cc, length: { maximum: 200 }
end
