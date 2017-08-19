class Item < ApplicationRecord
	has_many :reviews
	belongs_to :restaurant
  has_many :itemtypes
	has_many :types, through: :itemtypes, source: :type
  validates :entry_id, uniqueness:true
end
