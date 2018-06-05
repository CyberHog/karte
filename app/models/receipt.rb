class Receipt < ApplicationRecord
  belongs_to :medical_chart, optional: true
  belongs_to :patients_receipt, optional: true

  enum payment_method: { 現金: 0, カード: 1, クーポン: 2, ポイント: 3 }

  validates :payment_method, :service, :payment, presence: true
  validates :payment, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
