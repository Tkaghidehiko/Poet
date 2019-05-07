class PostPoem < ApplicationRecord
	belongs_to :user, foreign_key: 'user_id'
	belongs_to :song, foreign_key: 'song_id'

	has_many :post_trans, dependent: :destroy
end
