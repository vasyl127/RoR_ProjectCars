require_relative 'services/filter/filter'
require_relative 'services/cars_service'
require_relative 'trash_controller'

class CarsController < ApplicationController
  before_action :set_cars, only: %i[index]
  before_action :set_car, only: %i[destroy edit update show create]

  def index; end

  def show; end

  def destroy
    trash.trash_car(@car)
    flash[:success] = "#{@car.name} move to trash!"
    redirect_to cars_path
  end

  def new
    @car = Car.new
  end

  def edit; end

  def update
    if cars_service.update(@car, car_params)
      redirect_to cars_path
      flash[:success] = "#{@car.name} updated!"
    else
      render :new
    end
  end

  def create
    # if cars_service.create(car_params)
    # dont work errors messages, need fix
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

  def cars_service
    cars_service ||= CarsService.new
  end

  def car_filter
    car_filter ||= CarFilter.new
  end

  def trash
    trash ||= TrashController.new
  end

  def set_cars
    @cars = car_filter.cars_all
  end

  def set_car
    @car = car_filter.car_by_id(params[:id])
  end
end
