# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airlines = []

[
  {
    name: 'United Airlines',
    image_url: 'https://open-flights.s3.amazonaws.com/United-Airlines.png'
  },
  {
    name: 'Southwest',
    image_url: 'https://open-flights.s3.amazonaws.com/Southwest-Airlines.png'
  },
  {
    name: 'Delta',
    image_url: 'https://open-flights.s3.amazonaws.com/Delta.png'
  },
  {
    name: 'Alaska Airlines',
    image_url: 'https://open-flights.s3.amazonaws.com/Alaska-Airlines.png'
  },
  {
    name: 'JetBlue',
    image_url: 'https://open-flights.s3.amazonaws.com/JetBlue.png'
  },
  {
    name: 'American Airlines',
    image_url: 'https://open-flights.s3.amazonaws.com/American-Airlines.png'
  }
].each do |airline|
  airlines << Airline.find_or_create_by!(name: airline[:name], image_url: airline[:image_url])
end

reviews = []

[
  {
    title: 'Great Airline',
    description: 'I had a lovely time.',
    score: 5,
    airline: airlines.first
  },
  {
    title: 'Bad Airline',
    description: 'I had a bad time.',
    score: 1,
    airline: airlines.first
  }
].each do |airline|
  reviews << Review.find_or_create_by!(title: airline[:title], description: airline[:description], score: airline[:score], airline: airline[:airline])
end
