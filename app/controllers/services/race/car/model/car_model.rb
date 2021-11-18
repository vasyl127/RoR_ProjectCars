require_relative 'engine'
require_relative 'gearbox'


class CarModel
  attr_reader :speed, :odo, :max_speed, :engine, :gearbox, :name

  def initialize(config)
    @name = config[:name]
    @speed = 0
    @odo = 0
    @max_speed = config[:max_speed]
    @engine = Engine.new(config)
    @gearbox = Gearbox.new(config)
  end

  def ch_speed(value)
    @speed = value
  end

  def ch_max_speed(value)
    @max_speed = value
  end

  def ch_odo(value)
    @odo = value
  end


end
