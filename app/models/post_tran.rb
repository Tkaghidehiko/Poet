class PostTran < ApplicationRecord
	belongs_to :post_poem
	belongs_to :user

	has_many :favorites, dependent: :destroy
end
