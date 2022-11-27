class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews
  has_many :directions
  validates :name, :ingredients, :photo, presence: true
  accepts_nested_attributes_for :directions, allow_destroy: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_ingredients,
    against: [ :name, :ingredients ],
    using: {
      tsearch: { prefix: true }
    }


  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1)
    else
      0.0
    end
  end

  def avg_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end
