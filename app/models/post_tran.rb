class PostTran < ApplicationRecord
	belongs_to :post_poem, foreign_key: 'post_poem_id'
	belongs_to :user, foreign_key: 'user_id'

	has_many :favorites, dependent: :destroy
end
