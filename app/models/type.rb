class Type < ApplicationRecord
  has_many :itemtypes
	has_many :items, through: :itemtypes, source: :item
  validates :name, uniqueness:true
end
