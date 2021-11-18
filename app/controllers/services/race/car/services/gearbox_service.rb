

class GearboxService
  
  def g_up(gearbox, engine)
    if gearbox.gear < gearbox.max_gear && engine.rpm > 1200
      engine.ch_rpm(engine.rpm - 600)
      gearbox.ch_gear(gearbox.gear + 1)
    end
  end

  def g_down(gearbox, engine)
    if gearbox.gear > 0
      engine.ch_rpm(engine.rpm + 600)
      gearbox.ch_gear(gearbox.gear - 1)
    end
  end

end
