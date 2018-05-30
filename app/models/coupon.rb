class Coupon < ApplicationRecord
  belongs_to :receipt, optional: true
  belongs_to :menu, optional: true
  belongs_to :patients_receipt, optional: true
  belongs_to :seller, class_name: "User", optional: true	# クリニック
  belongs_to :buyer, class_name: "User", optional: true		# 購入者

  validates :remaining, numericality: { only_integer: true,
		greater_than_or_equal_to: 0, allow_blank: true}



end