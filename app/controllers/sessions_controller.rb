class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Tài khoản chưa được kích hoạt. "
        message += "Vui lòng kiểm tra email để kích hoạt tài khoản của bạn."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Tên đăng nhập hoặc mật khẩu không đúng!"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
