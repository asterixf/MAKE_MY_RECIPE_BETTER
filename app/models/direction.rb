class Direction < ApplicationRecord
  belongs_to :recipe

  validates :step, presence: true
  validates :recipe, presence: true
end
