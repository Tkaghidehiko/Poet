class PostPoem < ApplicationRecord

	belongs_to :song

	has_many :post_trans, dependent: :destroy
end
