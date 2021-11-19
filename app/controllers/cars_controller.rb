require_relative "services/filter"
require_relative "services/trash_service"


class CarsController < ApplicationController
  before_action :filter_init, :trash_init, :set_cars, :set_car
  
  def index
  end

  def show
  end

  def destroy
    @trash.move_to_trash(@car)
    flash[:success] = "#{@car.name} move to trash!"
    redirect_to cars_path
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def update
    if @car.update car_params
      redirect_to cars_path
      flash[:success] = "#{@car.name} updated!"
    else
      render :new
    end
  end

  def create
    @car = Car.new car_params
    if @car.save
      flash[:success] = "#{@car.name} created!"
      redirect_to cars_path
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :max_rpm, :torque, :max_gear, :max_speed, :description)
  end

  def filter_init
    @filter = Filter.new
  end

  def trash_init
    @trash = TrashService.new
  end

  def set_cars
    @cars = @filter.cars_all
  end

  def set_car
    @car = @filter.car_by_id(params[:id])
  end


end
