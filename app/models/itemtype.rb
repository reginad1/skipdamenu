class Itemtype < ApplicationRecord
	belongs_to :item
	belongs_to :type
end
