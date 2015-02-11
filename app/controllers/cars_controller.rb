class CarsController < ApplicationController

  before_action :authorize

  def index
    @cars = Car.all.where(user_id: params[:user_id])
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    @user = User.find(params[:user_id])
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = params[:user_id]
    if @car.save
      redirect_to user_cars_path(params[:user_id])
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to user_cars_path(params[:user_id])
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])

    if @car.destroy
      redirect_to cars_path
    end

  end

  # Parameters required to create a new car

  def car_params
    params.require(:car).permit(:name, :odometer)
  end

end
