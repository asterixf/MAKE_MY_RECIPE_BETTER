class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :about_me, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks
  has_many :recipes
  has_many :reviews
  has_one_attached :photo
end
