
class Gearbox
  attr_reader :gear, :max_gear

  def initialize(config)
    @gear = 0
    @max_gear = config[:max_gear]
  end

  def ch_gear(value)
    @gear = value
  end

  def ch_max_gear(value)
    @max_gear = value
  end


end
