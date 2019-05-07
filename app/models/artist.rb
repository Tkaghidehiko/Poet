class Artist < ApplicationRecord
	belongs_to :user, optional: true,  foreign_key: 'user_id'
	has_many :songs, dependent: :destroy
	has_many :post_poems, through: :songs, dependent: :destroy
  	has_many :post_trans, through: :post_poems, dependent: :destroy
end
