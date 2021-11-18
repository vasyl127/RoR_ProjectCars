require_relative "services/race/race_logic"
require_relative "services/filter"


class RacesController < ApplicationController
before_action :filter_init, :set_race, :set_races, :set_cars, :set_car

  def index
  end

  def show
  end

  def select_car
    @race_car = @cars - @race.cars
  end

  def add_race_car
    @race.cars += [@car]
    if @race.save
      redirect_to "/races/#{@race.id}"
    else
      render :new
    end
  end

  def delete_race_car
    flash[:success] = "#{@car.name} was removed from the race"
    @race.cars.delete(@car)
    redirect_to "/races/#{@race.id}"
  end

  def new
    @race = Race.new
  end

  def edit
  end

  def start_race
    #@race , @races, @cars
    @race_logic = RaceLogic.new
    @race_logic.add_cars(@race.cars)
  end

  def create
    @race = Race.new race_params
    if @race.save
      redirect_to races_path
      flash[:success] = 'Race created!'
    else
      render :new
    end
  end

  def update
    if @race.update race_params
      redirect_to races_path
      flash[:success] = 'Race updated!'
    else
      render :new
    end
  end

  def trash
    @race = races_deleted
  end

  def destroy
    if @race.deleted == 0
      @race.deleted = 1
      @race.save
    else
      @race.destroy
    end
    flash[:success] = 'Race deleted!'
    redirect_to races_path
  end

  private

  def filter_init
    @filter = Filter.new
  end

  def race_params
    params.require(:race).permit(:name,:description)
  end

  def set_cars
    @cars = @filter.cars_all
  end

  def set_car
    @car = @filter.car_by_id(params[:id]||params[:car_id])
  end

  def set_races
    @races = @filter.races_all
  end

  def set_race
    @race = @filter.race_by_id(params[:id]||params[:race_id])
  end

end
