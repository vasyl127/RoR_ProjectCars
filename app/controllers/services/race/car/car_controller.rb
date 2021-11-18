require_relative 'services/car_service'


class CarController

  attr_reader :car_service

  def initialize(car)
    @car_service = CarService.new(car)
  end

  def start
    car_service.start
  end

  def stop
    car_service.stop
  end

  def gas
    car_service.gas
  end

  def g_up
    car_service.g_up
  end

  def g_down
    car_service.g_down
  end

  def breake
    car_service.breake
  end

  def car_state
    car_service.car_state
  end

  def shift_gear
  car_service.shift_gear
  end

  def shift_odo
    car_service.shift_odo
  end

  def shift_speed
    car_service.shift_speed
  end

  def car_state
    car_service.car_state
  end

  def odo
    car_service.odo
  end

  def name
    car_service.name
  end
end
