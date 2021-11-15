class RacesController < ApplicationController
before_action :set_races, :set_cars
before_action :set_race, exception: %i[new create destroy add_race_car delete_race_car]

  def index
  end

  def show
  end

  def select_car
    @race_car = @cars - @race.cars
  end

  def add_race_car
    @race = Race.find_by id: params[:race_id]
    @car = Car.find_by id: params[:car_id]
    @race.cars += [@car]
    if @race.save
      redirect_to "/races/#{@race.id}"
    else
      render :new
    end
  end

  def delete_race_car
    @race = Race.find_by id: params[:race_id]
    @car = Car.find_by id: params[:car_id]
    @race.cars.delete(@car)
    flash[:success] = 'Сar was removed from the race'
    redirect_to "/races/#{@race.id}"
  end

  def new
    @race = Race.new
  end

  def edit
  end

  def start_race
    
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

  def destroy
    @race.destroy
    flash[:success] = 'Race deleted!'
    redirect_to races_path
  end

  private

  def race_params
    params.require(:race).permit(:name,:description)
  end

  def set_cars
    @cars = Car.all
  end

  def set_races
    @races = Race.all
  end

  def set_race
    @race = Race.find_by id: params[:id]
  end

end
