class KarteMenu < ApplicationRecord
  belongs_to :medical_chart, optional: true

  validates :course, presence: true
end
