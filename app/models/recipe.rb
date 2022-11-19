class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews

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
