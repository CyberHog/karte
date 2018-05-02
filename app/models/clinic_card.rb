class ClinicCard < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :patient, optional: true
  has_many :patients_receipts, dependent: :nullify
  has_many :receipts, through: :patients_receipts
  has_many :card_numbers, dependent: :destroy, inverse_of: :clinic_card
  accepts_nested_attributes_for :card_numbers, allow_destroy: true

  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
