class Song < ApplicationRecord
	belongs_to :user
	belongs_to :artist

	has_many :post_poems, dependent: :destroy
end
