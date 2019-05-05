class Favorite < ApplicationRecord
	belongs_to :user
	has_many :songs, dependent: :destroy
	has_many :artists, dependent: :destroy
	has_many :post_trans, dependen: :destroy
end
