require_relative 'services/car_service'

class CarController
  attr_reader :car_service

  def initialize(car)
    @car_service = CarService.new(car)
  end

  delegate :start, to: :car_service

  delegate :stop, to: :car_service

  delegate :gas, to: :car_service

  delegate :g_up, to: :car_service

  delegate :g_down, to: :car_service

  delegate :breake, to: :car_service

  delegate :car_state, to: :car_service

  delegate :shift_gear, to: :car_service

  delegate :shift_odo, to: :car_service

  delegate :shift_speed, to: :car_service

  delegate :car_state, to: :car_service

  delegate :odo, to: :car_service

  delegate :name, to: :car_service

  delegate :speed, to: :car_service
end
