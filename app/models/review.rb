class Review < ApplicationRecord

	belongs_to :item 
	belongs_to :user
	mount_uploader :image, ImageUploader
end
