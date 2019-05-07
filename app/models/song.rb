class Song < ApplicationRecord
	belongs_to :user, foreign_key: 'user_id'
	belongs_to :artist, foreign_key: 'artist_id'

	has_many :post_poems, dependent: :destroy
		accepts_nested_attributes_for :post_poems, allow_destroy: true

	has_many :favorites, dependent: :destroy
end
