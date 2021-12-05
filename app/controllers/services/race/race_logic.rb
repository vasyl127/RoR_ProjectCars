require_relative 'car/model/car_model'
require_relative 'car/car_controller'

class RaceLogic
  attr_reader :cars, :time, :dist

  def initialize
    @cars = []
    @time = 60
    @dist = 2000
  end

  def add_cars(cars)
    cars.each do |car|
      add_car(car)
    end
  end

  def add_car(car)
    @cars << CarController.new(CarModel.new(car))
  end

  def cars_preparation(objects)
    add_cars(objects)
    @cars.each do |car|
      car.start
    end
  end

  def race_on_time(objects)
    cars_preparation(objects)
    @time.times do
      @cars.each do |car|
        race_body(car)
      end
    end
    cars
  end

  def race_on_dist(objects)
    cars_preparation(objects)
    while !check_odo
      @cars.each do |car|
        race_body(car)
      end
    end
    cars
  end

  def race_body(car)
      car.gas
      car.shift_gear
      car.shift_speed
      car.shift_odo
  end

  def check_odo
    check = false
    @cars.each do |car|
      check = true if car.odo >= @dist
    end
    check
  end
end
