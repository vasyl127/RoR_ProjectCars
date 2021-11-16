

class EngService

  def start(engine)
    engine.ch_rpm(1200)
  end

  def stop(engine)
    engine.ch_rpm(0)
  end

  def gas(engine)
    engine.ch_rpm(engine.rpm+400) if engine.rpm < engine.max_rpm
  end

end
