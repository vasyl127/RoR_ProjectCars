class RacesController < ApplicationController
before_action :set_races
before_action :set_race, exception: %i[new create destroy]

  def index
  end

  def show
    @cars = Car.all
    @race_car = RaceCar.where(race_id: @race.id)

  end
  def add_car
    @race_car = RaceCar.where(race_id: @race.id)
    @cars = Car.all
    # @cars = Car.where.not(id: @race_car.car_id)

  end

  def add_race_car
    @race = Race.find_by id: params[:race_id]
    @car = Car.find_by id: params[:car_id]
    @race_car = RaceCar.new car_id: @car.id, race_id: @race.id
    if @race_car.save
      redirect_to "/races/#{@race.id}"
    else
      render :new
    end
  end

  def new
    @race = Race.new
  end

  def edit
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

  def set_races
    @races = Race.all
  end

  def set_race
    @race = Race.find_by id: params[:id]
  end

end
