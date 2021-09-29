class ShowsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @shows = Show.where("date_show >= ? and movie_id = ?", Date.today, @movie.id)
    @screens = Screen.all
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @shows = Show.where(movie_id: @movie.id)
  end
end
