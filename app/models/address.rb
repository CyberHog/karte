class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postcode, length: { maximum: 7 }
  validates :building, length: { maximum: 30, allow_blank: true }

  validates :postcode, :prefecture, :city, :street, presence: true, if: :business?

  def business?
  	user.business == true
  end

end
