class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])  
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      ExampleMailer.sample_email(@user).deliver
      flash[:info] = "Vui lòng kiểm tra email để kích hoạt tài khoản của bạn.\n"
      redirect_to root_url
    else
      render 'new'  
    end
  end

  def update
    @user = User.find(params[:id])
    current_password = params[:user][:current_password]
    user = User.authenticate(@user.email, current_password)
    
    if @user && user
      if @user.update(user_params)
        flash[:success] = "Cập nhật thành công"
        redirect_to @user
      else
        render 'edit'
      end
    else
      flash[:danger] = "Sai mật khẩu"
      render 'edit'    
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :date_of_birth, :gender, :favorite_cinema, :avatar)
    end
end
