
class Engine
  attr_reader :rpm, :max_rpm, :torque

  def initialize(config)
    @rpm = 0
    @max_rpm = config[:max_rpm]
    @torque = config[:torque]
  end

  def ch_rpm(value)
    @rpm = value
  end

  def ch_max_rpm(value)
    @max_rpm = value
  end

  def ch_torque(value)
    @torque = value
  end


end
