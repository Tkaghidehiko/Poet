class Song < ApplicationRecord

	belongs_to :artist, optional: true


	has_many :post_poems, inverse_of: :song
	accepts_nested_attributes_for :post_poems, reject_if: :all_blank, allow_destroy: true
	has_many :post_trans, through: :post_poem, dependent: :destroy


	has_many :favorites, dependent: :destroy

end
