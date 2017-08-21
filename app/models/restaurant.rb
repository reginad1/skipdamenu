class Restaurant < ApplicationRecord
  has_many :items
  validates :foursq_id, uniqueness:true
end
