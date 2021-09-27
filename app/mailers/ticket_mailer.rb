class TicketMailer < ApplicationMailer
  default from: "trinhminhlongad@gmail.com"

  def ticket_mailer user, ticket_id
    @user = user
    @booking_ticket = BookingTicket.find(ticket_id)
    @show = Show.find(@booking_ticket.show_id)
    @movie = Movie.find(@show.movie_id)
    @screen = Screen.find(@show.screen_id)
    @cinema = Cinema.find(@screen.cinema_id)
    @seat_reserveds = SeatReserved.where(booking_ticket_id: @booking_ticket.id)
    @cinema_seats = CinemaSeat.all
    @detail_food_orders = DetailFoodOrder.where(booking_ticket_id: @booking_ticket.id)
    @foods = Food.all
    
    mail to: @user.email, subject: "CGV Ticket"
  end
end
