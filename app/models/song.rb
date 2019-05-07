class Song < ApplicationRecord
	belongs_to :user, foreign_key: 'user_id'
	belongs_to :artist, foreign_key: 'artist_id'

	has_many :post_poems, inverse_of: :song
	accepts_nested_attributes_for :post_poems, reject_if: :all_blank, allow_destroy: true
	has_many :post_trans, through: :post_poem, dependent: :destroy


	has_many :favorites, through: :users, dependent: :destroy

end
