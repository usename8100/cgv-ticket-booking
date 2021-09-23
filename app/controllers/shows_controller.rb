class ShowsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @shows = Show.where(movie_id: params[:movie_id])
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @shows = Show.where(movie_id: params[:id])
  end
end
