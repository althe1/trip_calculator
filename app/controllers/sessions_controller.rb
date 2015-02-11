class SessionsController < ApplicationController

  def new
  end

  def create

    # Finds User with email

    user = User.find_by(email: params[:user][:email])

    # Login authentication check to see if email and password are valid

    if user && user.authenticate(params[:user][:password])

      # Login Success Alert Message

      flash[:success] = "You signed in successfully!"
      session[:user_id] = user.id
      redirect_to user_cars_path(user_id: user.id)
    else

      # Incorrect Login Information Alert

      flash.now[:danger] = "Email or password incorrect."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signin'
  end

end
