class Movie < ApplicationRecord
  belongs_to :movie_genre, optional: true
end
