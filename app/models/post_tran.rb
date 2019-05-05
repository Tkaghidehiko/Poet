class PostTran < ApplicationRecord
	belongs_to :post_poem
	belongs_to :user
end
