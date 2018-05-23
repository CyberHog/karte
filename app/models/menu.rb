class Menu < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id", optional: true
  belongs_to :receipt, optional: true
  belongs_to :medical_chart, optional: true
  has_many :coupons, dependent: :nullify

  validates :content_id, presence: true,
		numericality: { only_integer: true,
		greater_than: 0, allow_blank: true}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :attached_point, presence: true,
  		numericality: { only_integer: true,
  			allow_blank: true }

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
