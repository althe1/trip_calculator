class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.create(user_params)

    if @user.valid? && @user.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
