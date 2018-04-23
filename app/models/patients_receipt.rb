class PatientsReceipt < ApplicationRecord
  belongs_to :clinic_card, optional: true
  has_many :receipts, dependent: :destroy, inverse_of: :patients_receipt
  accepts_nested_attributes_for :receipts, allow_destroy: true
end
