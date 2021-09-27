class ScreensController < ApplicationController
  before_action :logged_in_user, only: [:show]
  
  def index
    @screens = Screen.where(id: params[:id])
    @cinema_seats = CinemaSeat.where(screen_id: @screens.id)
  end

  def show
    @show = Show.find(params[:show_id])
    @screen = Screen.find_by(id: @show.screen_id)
    @cinema_seats = CinemaSeat.where(screen_id: @screen.id)
    seat_reserveds = CinemaSeat.includes(:seat_reserveds).where(seat_reserveds: {show_id: @show.id})
    @seat_reserved_ids = seat_reserveds.pluck(:id)
  end

  def edit
    
  end
end
