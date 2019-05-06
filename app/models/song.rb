class Song < ApplicationRecord
	belongs_to :user
	belongs_to :artist

	has_one :post_poem, dependent: :destroy
	has_many :post_trans, through: :poem_sentences, dependent: :destroy
	has_many :sentences, through: :post_poems, dependent: :destroy

	has_many :favorites, dependent: :destroy
end
