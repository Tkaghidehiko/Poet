class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :artists, dependent: :destroy
  has_many :songs, through: :artists, dependent: :destroy
  has_many :post_poems, through: :songs, dependent: :destroy
  has_many :post_trans, through: :post_poems, dependent: :destroy

  has_many :favorites, dependent: :destroy
end
