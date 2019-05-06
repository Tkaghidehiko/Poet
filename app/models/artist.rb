class Artist < ApplicationRecord
	belongs_to :user
	has_many :songs, dependent: :destroy
	has_many :post_poems, through: :songs, dependent: :destroy
  	has_many :post_trans, through: :post_poems, dependent: :destroy
end
