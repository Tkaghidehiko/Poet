class Favorite < ApplicationRecord
	belongs_to :user, foreign_key: 'user_id'
	belongs_to :song, foreign_key: 'song_id'
	belongs_to :post_tran,  foreign_key: 'tran_id',

end
