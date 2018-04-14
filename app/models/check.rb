class Check < ApplicationRecord
  belongs_to :receipt, optional: true
  belongs_to :menu, optional: true

end
