class ClinicCard < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :publisher, class_name: "User", optional: true
  belongs_to :holder, class_name: "User", optional: true
  has_many :patients_receipts, dependent: :nullify
  has_many :receipts, through: :patients_receipts

  validates :number, presence: true,
    format: { with: /\A[a-z0-9]+\z/i, allow_blank: true,
              message: :invalid_card_number },
    length: { minimum: 1, maximum: 20 }
  validates :holding_point, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
