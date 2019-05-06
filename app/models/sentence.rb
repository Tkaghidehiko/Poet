class Sentence < ApplicationRecord
	belongs_to :post_poem
	belongs_to :user
	has_many :post_trans, dependent: :destroy
end
