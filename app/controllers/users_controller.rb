class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Check to see if user parameters are valid and are saved

    if @user.valid? && @user.save
      session[:user_id] = @user.id
      redirect_to user_cars_path(user_id: @user.id)
    else
      render :new
    end

  end

  # Parameters required to create a new user
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
