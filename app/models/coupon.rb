class Coupon < ApplicationRecord
  belongs_to :patients_receipt, optional: true
  belongs_to :seller, class_name: "User", optional: true	# クリニック
  belongs_to :buyer, class_name: "User", optional: true		# 購入者

  validates :remaining, numericality: { only_integer: true,
		greater_than_or_equal_to: 0, allow_blank: true}

  class << self
  	def search(query)
  	  rel = order("created_at")
  	  if query.present?
  		rel = rel.where("name LIKE ? OR expiration_date LIKE ?",
  			"%#{query}%", "%#{query}%")
  	  end
  	  rel
    end
  end
end