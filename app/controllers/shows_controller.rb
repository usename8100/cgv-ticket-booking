class ShowsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @shows = Show.where(movie_id: @movie.id)
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @shows = Show.where(movie_id: @movie.id)
  end
end
