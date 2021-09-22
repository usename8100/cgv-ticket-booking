class Movie < ApplicationRecord
  extend FriendlyId
  belongs_to :movie_genre, optional: true
  has_and_belongs_to_many :shows

  ransack_alias :movie_genre, :movie_genre_genre
  friendly_id :title, use: :slugged
end
