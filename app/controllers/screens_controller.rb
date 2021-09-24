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
  end

  def edit
    
  end
end
