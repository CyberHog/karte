class Staff < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :medical_chart, optional: true

  validates :staff_number, presence: true,
		numericality: { only_integer: true,
		greater_than_or_equal_to: 0 },uniqueness: true
  validates :staff_name, presence: true

  class << self
  	def search(query)
  	  rel = order("staff_number")
  	  if query.present?
  		rel = rel.where("staff_name LIKE ? OR staff_number LIKE ?",
  			"%#{query}%", "%#{query}%")
  	  end
  	  rel
    end
  end
end
