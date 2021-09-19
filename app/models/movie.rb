class Movie < ApplicationRecord
  belongs_to :movie_genre, optional: true

  ransack_alias :movie_genre, :movie_genre_genre
end
