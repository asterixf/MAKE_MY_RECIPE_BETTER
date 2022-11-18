class Review < ApplicationRecord
  validates :score, presence: true
  validates :comment, presence: true
  belongs_to :user
  belongs_to :recipe
end
