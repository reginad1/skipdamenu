class Item < ApplicationRecord
	has_many :reviews
	belongs_to :restaurant
	has_many :types, through: :itemtypes
end
