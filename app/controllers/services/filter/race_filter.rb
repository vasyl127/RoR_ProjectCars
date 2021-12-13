require_relative 'filter'

class RaceFilter < Filter
  def initialize
    super(Race)
  end   

  def races_for_car(car)
    Race.joins(:race_cars).where('race_cars.car_id = ?', car.id)
  end
end
