class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend

  private
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Vui lòng đăng nhập để thực hiện đặt vé."
        redirect_to login_url
      end
    end
end
