class Item < ApplicationRecord
	has_many :reviews
	belongs_to :restaurant
  has_many :itemtypes
	has_many :types, through: :itemtypes, source: :type
  validates :entry_id, uniqueness:true
  accepts_nested_attributes_for :reviews, reject_if: proc { |attributes| attributes['body'].blank? }

end
