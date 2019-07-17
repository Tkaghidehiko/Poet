class Song < ApplicationRecord

	belongs_to :artist, optional: true


	has_many :post_poems, inverse_of: :song
	accepts_nested_attributes_for :post_poems, reject_if: :all_blank, allow_destroy: true
	has_many :post_trans, through: :post_poem, dependent: :destroy


	has_many :favorites, dependent: :destroy


	validates :album_name, length: { maximum: 60 }

	validates :song_name, presence: true, length: { maximum: 30 }

	validates :artist_id, :uniqueness => {:scope => :song_name}

end
