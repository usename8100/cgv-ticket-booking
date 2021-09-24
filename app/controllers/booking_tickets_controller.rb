class BookingTicketsController < ApplicationController
  def new
    @show = Show.find(params[:show_id])
    @movie = Movie.find(@show.movie_id)
    @booking_ticket = BookingTicket.new
    @booking_ticket.show_id = @show.id
    @foods = Food.all
  end

  def create
    seat_quantity = params[:booking_ticket][:seat_quantity]
    seat_name_str = params[:booking_ticket][:seat_ids]
    seat_total_price = 0
    show = Show.find(params[:show_id])

    @booking_ticket = BookingTicket.new
    @booking_ticket.user_id = current_user.id
    @booking_ticket.seat_quantity = seat_quantity.to_i
    @booking_ticket.show_id = show.id
    @booking_ticket.status = false
    @booking_ticket.create_at = Time.zone.now
    seat_name_str.split(",").each do |c_seat_name|
      CinemaSeat.all.each do |seat|
        if (seat.row == (c_seat_name.first.ord - 64) and seat.seat_no == c_seat_name.last.to_i) and seat.screen_id == show.screen_id
          seat_total_price += seat.price
        end
      end
    end
    @booking_ticket.seat_total_price = seat_total_price

    if @booking_ticket.save
      seat_name_str.split(",").each do |c_seat_name|
        @seat_reserved = SeatReserved.new
        CinemaSeat.all.each do |seat|
          if (seat.row == (c_seat_name.first.ord - 64) and seat.seat_no == c_seat_name.last.to_i) and seat.screen_id == show.screen_id
            @seat_reserved.cinema_seat_id = seat.id
            seat_total_price += seat.price
          end
        end
        @seat_reserved.show_id = params[:show_id]
        @seat_reserved.booking_ticket_id = @booking_ticket.id
        @seat_reserved.status = true
        if @seat_reserved.save
          flash[:info] = "Yay! Save done!!!.\n"
        else
          flash[:info] = "Yay! Save UNdone!!!.\n"
        end
      end
      
      flash[:info] = "Đặt vé thành công.\n"
      redirect_to movies_path
    else
      redirect_to root_url 
    end
  end
end
