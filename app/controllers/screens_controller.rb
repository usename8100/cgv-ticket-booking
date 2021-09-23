class ScreensController < ApplicationController
  def index
    @screens = Screen.where(id: params[:id])
    @cinema_seats = CinemaSeat.where(screen_id: @screens.id)
  end

  def show
    show = Show.find(params[:id])
    @screen = Screen.find_by(id: show.screen_id)
    @cinema_seats = CinemaSeat.where(screen_id: @screen.id)
  end
end
