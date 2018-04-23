class ClinicCard < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :patient, optional: true
  has_many :patients_receipts, dependent: :nullify

  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
