class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find_by id: params[:id]
  end

  def destroy
    @car = Car.find_by id: params[:id]
    @car.destroy
    flash[:success] = 'Car deleted!'
    redirect_to cars_path
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find_by id: params[:id]
  end

  def update
    @car = Car.find_by id: params[:id]
    if @car.update car_params
      redirect_to cars_path
      flash[:success] = 'Car updated!'
    else
      render :new
    end
  end

  def create
    @car = Car.new car_params
    if @car.save
      flash[:success] = 'Car created!'
      redirect_to cars_path
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :max_rpm, :torque, :max_gear, :max_speed, :description)
  end
end
