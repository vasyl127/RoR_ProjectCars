require_relative 'car/model/car_model'
require_relative 'car/car_controller'

class RaceLogic
  attr_reader :cars, :time

  def initialize
    @cars = []
    @time = 60
  end

  def add_cars(cars)
    cars.each do |car|
      add_car(car)
    end
  end

  def add_car(car)
    @cars << CarController.new(CarModel.new(car))
  end

  def cars_preparation
    @cars.each do |car|
      car.start
    end
  end

  def race_on_time(objects)
    add_cars(objects)
    cars_preparation
    @time.times do
      @cars.each do |car|
        car.gas
        car.shift_gear
        car.shift_speed
        car.shift_odo
      end
    end
    cars
  end

  def check_max_odo
    max_odo = 0
    @cars.each do |car|
      max_odo = car.odo if max_odo < car.odo
    end
    max_odo
  end

  def check_win
    winner = []
    max_odo = check_max_odo
    @cars.each do |car|
      winner << car if max_odo == car.odo
    end
    winner
  end
end
