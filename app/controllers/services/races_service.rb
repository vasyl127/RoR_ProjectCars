require_relative 'race/race_logic'
require_relative 'filter/race_filter'

class RacesService
  def create(race_params)
    race = Race.new race_params
    race.save
  end

  def update(race, race_params)
    race.update race_params
    race.save
  end

  def add_to_race(car, race)
    race_filter.cars_in_race(race) << car
  end 

  def race_logic
    race_logic ||= RaceLogic.new
  end

  def start_race(cars, race)
    if race.race_type == 'on_time'
      race_logic.race_on_time(cars)
    else
      race_logic.race_on_dist(cars)
    end
  end

  delegate :race_on_time, to: :race_logic

  delegate :race_on_dist, to: :race_logic

  def race_conf
    race_conf = { time: race_logic.time, dist: race_logic.dist }
  end

  private

  def race_filter
    race_filter ||= RaceFilter.new
  end

end
