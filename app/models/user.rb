class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_trans, through: :post_poems, dependent: :destroy

  has_many :favorites, dependent: :destroy

  validates :nick_name, presence: true, uniqueness: true, length: { in: 2..20 }
end
