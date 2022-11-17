class Review < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :recipe
end
