class MoviesController < ApplicationController

  def index
    @q = Movie.ransack(params[:q])
    @pagy, @movies = pagy(@q.result.includes(:movie_genre), items: 12)    
    #@movies = Movie.all
    @genres = MovieGenre.all
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
end
