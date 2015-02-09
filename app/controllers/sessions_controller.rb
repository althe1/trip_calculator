class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_by(email: params[:user][:email])

      if user && user.authenticate(params[:user][:password])
        flash[:success] = "You logged in successfully!"
        session[:user_id] = user.id
        redirect_to cars_path
      else
        flash.now[:danger] = "Username or password incorrect."
        redirect_to signup_path
      end
  end

  def destroy
    session[:user_id] = nil
      redirect_to signup_path
  end
  
end
