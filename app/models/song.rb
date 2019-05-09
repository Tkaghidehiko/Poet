class Song < ApplicationRecord
	belongs_to :artist, optional: true

	has_many :post_poems, dependent: :destroy
		accepts_nested_attributes_for :post_poems, allow_destroy: true

	has_many :favorites, dependent: :destroy
end
