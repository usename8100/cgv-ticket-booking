class BookingTicketsController < ApplicationController
  def new
    @show = Show.find(params[:show_id])
    @movie = Movie.find(@show.movie_id)
    @booking_ticket = BookingTicket.new
    @booking_ticket.show_id = @show.id
  end
end
