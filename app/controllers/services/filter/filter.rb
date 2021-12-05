require_relative '../../../models/car'
require_relative '../../../models/race'

class Filter
  def cars_in_race(race)
    race.cars  
  end

  def races_for_car(car)
    car.races
  end

  def cars_not_in_race(race)
    Car.where("id not in (?)", cars_in_race(race).ids)
  end
end
