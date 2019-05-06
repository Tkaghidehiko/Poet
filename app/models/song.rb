class Song < ApplicationRecord
	belongs_to :user
	belongs_to :artist

	has_one :post_poem, dependent: :destroy
	has_many :post_trans, through: :post_poem, dependent: :destroy
	has_many :users, through: :users, dependent: :destroy
end
