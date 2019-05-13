class PostTran < ApplicationRecord
	belongs_to :post_poem, optional: true
	belongs_to :user, optional: true

	has_many :favorites, dependent: :destroy

	validates :song_translate, presence: true, length: { in: 2..20 }
end
