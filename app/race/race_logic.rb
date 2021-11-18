require_relative "car/model/car_model"
require_relative "car/car_controller"


class RaceLogic
  attr_reader :cars, :time

  def initialize
    @cars = []
    @time = 60
  end

  def add_car_to_race (car)
    @cars << car
  end

  def cars_preparation
    @cars.each do |car|
      car.start
    end
  end

  def cars_state
    @cars.each do |car|
      car.car_state
    end
  end

  def start_race
    cars_preparation
    @time.times do
      @cars.each do |car|
        car.gas
        car.shift_gear
        car.shift_speed
        car.shift_odo
      end
    end
    show_winner
  end

  def check_max_odo
    puts @cars.max
  end

  def check_win
    winner = []
    max_odo = 0
    @cars.each do |car|
      max_odo = car.odo if max_odo < car.odo
    end
    @cars.each do |car|
      winner << car if max_odo == car.odo
    end
    winner
  end

  def show_winner
    cars = check_win
    puts "Winners:"
    cars.each do |car|
    puts car.name
    end
  end
end
