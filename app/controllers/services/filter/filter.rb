require_relative '../../../models/car'
require_relative '../../../models/race'

class Filter
  def cars_in_race(race)
    race.cars
  end

  def races_for_car(car)
    car.races
  end

  def cars_not_in_race(cars, race)
    race_car = cars - cars_in_race(race)
    # race_car = Car.where.not(race_id: race.id)
    # race_car = Car.where(race_id: !race.id)
  end
end
