require_relative 'eng_service'
require_relative 'gearbox_service'

class CarService
  attr_reader :eng_service, :gb_service, :car, :engine, :gearbox

  def initialize(car)
    @eng_service = EngService.new
    @gb_service = GearboxService.new
    @car = car
    @engine = car.engine
    @gearbox = car.gearbox
  end

  delegate :odo, to: :car

  delegate :speed, to: :car

  delegate :name, to: :car

  def start
    eng_service.start(engine)
  end

  def stop
    eng_service.stop(engine)
  end

  def gas
    eng_service.gas(engine)
  end

  def g_up
    gb_service.g_up(gearbox, engine)
  end

  def g_down
    gb_service.g_down(gearbox, engine)
  end

  def shift_gear
    g_up if engine.rpm >= engine.torque
  end

  def shift_odo
    car.ch_odo(car.odo + (car.speed / 10))
  end

  def shift_speed
    if car.max_speed > car.speed
      if engine.rpm <= engine.torque
        car.ch_speed(car.speed + 15)
      else
        car.ch_speed(car.speed + 5)
      end
    end
  end
end
