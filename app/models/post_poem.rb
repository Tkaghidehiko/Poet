class PostPoem < ApplicationRecord

	belongs_to :song

	has_many :post_trans, inverse_of: :post_poem
	accepts_nested_attributes_for :post_trans, reject_if: :all_blank, allow_destroy: true
end
