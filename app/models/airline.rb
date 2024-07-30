class Airline < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders]

  has_many :reviews

  def avg_score
    reviews.average(:score).round(2).to_f
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
