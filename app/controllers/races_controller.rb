require_relative 'services/races_service'
require_relative 'services/filter/race_filter'
require_relative 'services/filter/car_filter'
require_relative 'services/trash_service'

class RacesController < ApplicationController
  before_action :set_races, only: %i[index]
  before_action :set_race, except: %i[index new create]
  before_action :set_cars, only: %i[select_car]
  before_action :set_car, only: %i[select_car add_race_car delete_race_car]

  def index; end

  def show; end

  def select_car
    @race_car = race_filter.cars_not_in_race(@race)
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
    @cars_list = races_service.start_race(race_filter.cars_in_race(@race), @race).sort_by(&:odo).reverse
    @race_conf = races_service.race_conf
  end

  def create
    # if races_service.create(race_params)
    # dont work errors messages, need fix
    @race = Race.new race_params
    if @race.save
      redirect_to races_path
      flash[:success] = 'Race created!'
    else
      render :new
    end
  end

  def update
    if races_service.update(@race, race_params)
      redirect_to race_path
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

  def races_service
    races_service ||= RacesService.new
  end

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
    params.require(:race).permit(:name, :description, :race_type)
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
