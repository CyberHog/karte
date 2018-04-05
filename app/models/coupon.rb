class Coupon < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :clinic, optional: true
  belongs_to :menu, optional: true

end
