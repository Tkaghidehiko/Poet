class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :song
	belongs_to :post_tran

end
