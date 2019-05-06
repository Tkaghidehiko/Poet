class Song < ApplicationRecord
	belongs_to :user
	belongs_to :artist

	has_many :post_poems, dependent: :destroy
		accepts_nested_attributes_for :post_poems, allow_destroy: true

	has_many :post_trans, through: :poem_sentences, dependent: :destroy

	has_many :favorites, dependent: :destroy
end
