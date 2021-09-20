class Movie < ApplicationRecord
  extend FriendlyId
  belongs_to :movie_genre, optional: true

  ransack_alias :movie_genre, :movie_genre_genre
  friendly_id :title, use: :slugged
end
