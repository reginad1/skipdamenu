class Restaurant < ApplicationRecord
  validates :foursq_id, uniqueness:true
end
