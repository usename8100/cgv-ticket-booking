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
    total_seat_price = params[:booking_ticket][:total_seat_price]
    total_food_price = params[:booking_ticket][:total_food_price]
    food_ids_str = params[:booking_ticket][:food_ids]
    food_quans_str = params[:booking_ticket][:food_quans]

    show = Show.find(params[:show_id])

    @booking_ticket = BookingTicket.new
    @booking_ticket.user_id = current_user.id
    @booking_ticket.seat_quantity = seat_quantity.to_i
    @booking_ticket.show_id = show.id
    @booking_ticket.status = false
    @booking_ticket.create_at = Time.zone.now
    @booking_ticket.seat_total_price = total_seat_price.to_i
    @booking_ticket.food_total_price = total_food_price.to_i
    total_price = total_food_price.to_i + total_seat_price.to_i
    @booking_ticket.total = total_price

    if @booking_ticket.save
      #Saving seat reserved
      seat_name_str.split(",").each do |c_seat_name|
        @seat_reserved = SeatReserved.new
        CinemaSeat.all.each do |seat|
          if (seat.row == (c_seat_name.first.ord - 64) and seat.seat_no == c_seat_name.last.to_i) and seat.screen_id == show.screen_id
            @seat_reserved.cinema_seat_id = seat.id
          end
        end
        @seat_reserved.show_id = params[:show_id]
        @seat_reserved.booking_ticket_id = @booking_ticket.id
        @seat_reserved.status = true
        if @seat_reserved.save
          flash[:info] = "Luu ghe da dat thành công.\n"
        else
          flash[:danger] = "Opps! Save UNdone!!!.\n"
        end
      end

      #Saving detail food order
      food_ids_arr = food_ids_str.split(",")
      food_quans_arr = food_quans_str.split(",")

      food_ids_arr.length.times do |index|
        food = Food.find(food_ids_arr[index].to_i)
        total = food.price * food_quans_arr[index].to_i

        @detail_food_order = DetailFoodOrder.new
        @detail_food_order.booking_ticket_id = @booking_ticket.id
        @detail_food_order.food_id = food_ids_arr[index].to_i
        @detail_food_order.quantity = food_quans_arr[index].to_i
        @detail_food_order.total = total

        if @detail_food_order.save
          flash[:info] = "Luu hoa hoa don do an thành công.\n"
        else
          flash[:danger] = "Opps! Save UNdone!!!.\n"
        end 
      end
      flash[:info] = "Đặt vé thành công.\n"
      redirect_to movies_path
    else
      flash[:danger] = "Đặt vé khong thành công.\n"
      redirect_to root_url 
    end
  end
end
