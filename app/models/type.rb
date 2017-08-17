class Type < ApplicationRecord
	has_many :items, through: :itemtypes
end
