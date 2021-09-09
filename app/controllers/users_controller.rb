class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @user = User.find(params[:id])  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      ExampleMailer.sample_email(@user).deliver
      flash[:info] = "Please check your email to activate your account.\n"
      redirect_to root_url
    else
      render 'new'  
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :date_of_birth, :gender, :favorite_cinema)
    end
end
