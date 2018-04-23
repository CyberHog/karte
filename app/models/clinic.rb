class Clinic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :clinic_cards
  has_many :patients, through: :clinic_cards
  has_many :menus

  validates :name, length: { maximum: 20 }
end
