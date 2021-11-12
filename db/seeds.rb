# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

p "starts seeding"

Movie.destroy_all
List.destroy_all

# element_id = (1..1000).to_a
i = 0

20.times do
  # movie_url = URI.open("https://api.themoviedb.org/3/movie/#{element_id[i]}?api_key=c6b58876d59c3e77ec323ddd2f6d858c").read
  movie_url = URI.open("http://tmdb.lewagon.com/movie/top_rated").read
  movie = JSON.parse(movie_url)

  Movie.create!(
    title: movie["results"][i]["original_title"],
    overview: movie["results"][i]["overview"],
    poster_url: "https://www.themoviedb.org/t/p/w1280/#{movie["results"][i]["poster_path"]}",
    rating: movie["results"][i]["vote_average"]
  )

  # list_url = URI.open("https://api.themoviedb.org/3/list/#{element_id[i]}?api_key=c6b58876d59c3e77ec323ddd2f6d858c&language=en-US").read
  # list = JSON.parse(list_url)

  # List.create!(name: list["name"])

  i += 1
end

p Movie.all
p List.all

p "end seeding"
