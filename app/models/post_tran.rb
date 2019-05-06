class PostTran < ApplicationRecord
	belongs_to :sentense
	belongs_to :user

	has_many :favorites, dependent: :destroy
end
