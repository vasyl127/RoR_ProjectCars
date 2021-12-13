require_relative 'filter'

class CarFilter < Filter
  def initialize
    super(Car)
  end

  def cars_in_race(race)
    Car.joins(:race_cars).where('race_cars.race_id = ?', race.id)
  end

  def cars_not_in_race(race)
    Car.where.not(id: cars_in_race(race).ids)
  end
end
