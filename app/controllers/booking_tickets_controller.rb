class BookingTicketsController < ApplicationController
  def new
    @booking_ticket = BookingTicket.new
    @movies = Movie.all
    @shows = Show.where(movie_id: params[:id])
  end
  
  def index
    @movies = Movie.all
    @shows = Show.where(movie_id: params[:id])
  end

  def show
    @movies = Movie.all
    @shows = Show.where(movie_id: params[:id])  
  end

  def edit
    
  end
end
