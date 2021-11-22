require_relative 'services/race/race_logic'
require_relative 'services/filter/race_filter'
require_relative 'services/filter/car_filter'
require_relative 'services/trash_service'

class RacesController < ApplicationController
  before_action :set_race, :set_races, :set_cars, :set_car

  def index; end

  def show; end

  def select_car
    @race_car = @cars - @race.cars
    # @race_car = race_filter.cars_not_in_race(@race)
    # use filter
  end

  def add_race_car
    race_filter.cars_in_race(@race) << @car
    flash[:success] = "#{@car.name} was added to the race"
    redirect_to "/races/#{@race.id}"
  end

  def delete_race_car
    race_filter.cars_in_race(@race).delete(@car)
    flash[:success] = "#{@car.name} was removed from the race"
    redirect_to "/races/#{@race.id}"
  end

  def new
    @race = Race.new
  end

  def edit; end

  def start_race
    # @race , @races, @cars
    @race_logic = RaceLogic.new
    @race_logic.add_cars(race_filter.cars_in_race(@race))
  end

  def create
    @race = Race.new race_params
    if @race.save
      redirect_to races_path
      flash[:success] = "#{@race.name} created!"
    else
      render :new
    end
  end

  def update
    if @race.update race_params
      redirect_to races_path
      flash[:success] = "#{@race.name} updated!"
    else
      render :new
    end
  end

  def destroy
    trash.trash_race(@race)
    flash[:success] = "#{@race.name} move to trash!"
    redirect_to races_path
  end

  private

  def race_filter
    race_filter ||= RaceFilter.new
  end

  def car_filter
    car_filter ||= CarFilter.new
  end

  def trash
    trash ||= TrashService.new
  end

  def race_params
    params.require(:race).permit(:name, :description)
  end

  def set_cars
    @cars = car_filter.cars_all
  end

  def set_car
    @car = car_filter.car_by_id(params[:id] || params[:car_id])
  end

  def set_races
    @races = race_filter.races_all
  end

  def set_race
    @race = race_filter.race_by_id(params[:id] || params[:race_id])
  end
end
