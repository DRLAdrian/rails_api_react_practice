class Airline < ApplicationRecord
  has_many :reviews

  def avg_score
    reviews.average(:score).round(2).to_f
  end
end
