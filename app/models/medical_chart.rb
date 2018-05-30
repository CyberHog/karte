class MedicalChart < ApplicationRecord
  # ユーザー
  belongs_to :therapist, class_name: "User", optional: true
  belongs_to :patient, class_name: "User", optional: true

  has_many :karte_menus, dependent: :destroy, inverse_of: :medical_chart
  accepts_nested_attributes_for :karte_menus, allow_destroy: true
  has_many :menus
  has_many :staffs
  has_many :patients_receipts
  has_many :clinic_cards
  

  validates :cc, :tx_comment, :comment, :visited_at, presence: true
  validates :cc, length: { maximum: 200 }
end
