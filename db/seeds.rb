# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'rest-client'
require 'json'

def api_key
  ENV["API_KEY"]
end

def games_dataset
  api_data = { key: api_key }
  games = RestClient.get("https://api.rawg.io/api/games?key=#{api_data[:key]}")
  games_array = JSON.parse(games)["results"]

  user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
  user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

  games_array.each do |g|
    user = [user1, user2].sample
    Game.create(
      title: g["name"],
      genre: g["genres"][0]["name"],
      platform: g["platforms"][0]["platform"]["name"],
      image: g["background_image"],
      user_id: user.id
    )
  end
end

games_dataset()
puts "Seeding Games Data"
