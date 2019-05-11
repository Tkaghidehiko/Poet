class PostTran < ApplicationRecord
	belongs_to :post_poem, optional: true
	belongs_to :user, optional: true

	has_many :favorites, dependent: :destroy
end
