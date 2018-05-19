class PatientsReceipt < ApplicationRecord
  belongs_to :clinic_card, optional: true
  belongs_to :seller, class_name: "User", optional: true	# 受取人
  belongs_to :buyer, class_name: "User", optional: true		# 支払人
  has_many :receipts, dependent: :destroy, inverse_of: :patients_receipt
  accepts_nested_attributes_for :receipts, allow_destroy: true

  validates :payday, :payer, presence: true
end
