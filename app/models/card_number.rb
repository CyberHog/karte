class CardNumber < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :patient, optional: true
  belongs_to :clinic_card, optional: true

  validates :number,
    format: { with: /\A[A-Za-z0-9]\w*\z/, allow_blank: true,
          message: :invalid_card_number },
    length: { maximum: 20, allow_blank: true }

end
