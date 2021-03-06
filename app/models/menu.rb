class Menu < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id", optional: true
  belongs_to :medical_chart, optional: true
  has_many :coupons, dependent: :nullify

  validates :content_id, presence: true,
		numericality: { only_integer: true,
		greater_than: 0, allow_blank: true}
  validates :coupon, inclusion: { in: [true, false] }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :attached_point, presence: true,
  		numericality: { only_integer: true,
  			allow_blank: true }
  validates :counting, :validity_period, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :coupon?
  validates :coupon_number, exclusion: { in: %w(self.content_id) }


  def coupon?
    coupon == true
  end

  class << self
  	def search(query)
  	  rel = order("content_id")
  	  if query.present?
  		rel = rel.where("content_name LIKE ? OR price LIKE ?",
  			"%#{query}%", "%#{query}%")
  	  end
  	  rel
    end
  end
end
