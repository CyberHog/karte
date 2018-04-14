class Receipt < ApplicationRecord
  belongs_to :medical_chart, optional: true
  belongs_to :user, optional: true
  belongs_to :clinic, optional: true
  has_many :menus, dependent: :nullify
  has_many :menus, through: :checks

  enum payment_method: { 現金: 0, カード: 1, クーポン: 2, ポイント: 3 }

  validates :payday, :payment_method, :service, :payment, presence: true
  validates :payment, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
