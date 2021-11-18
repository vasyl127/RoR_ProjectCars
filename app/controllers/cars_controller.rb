class CarsController < ApplicationController
  before_action :filter_init, :set_cars, :set_car
  
  def index
  end

  def show
  end

  def destroy
    if @car.deleted == 0
      @car.deleted = 1
      @car.save
    else
      @car.destroy
    end
    flash[:success] = 'Car deleted!'
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

  def filter_init
    @filter = Filter.new
  end

  def set_cars
    @cars = @filter.cars_all
  end

  def set_car
    @car = @filter.car_by_id(params[:id]||params[:car_id])
  end


end
