require_relative 'race/race_logic'


class RacesService
  def create(race_params)
    race = Race.new race_params
    race.save
  end

  def update(race, race_params)
    race.update race_params
    race.save
  end

  def race_logic
    race_logic ||= RaceLogic.new
  end

  def start_race_on_time(cars)
    race_logic.race_on_time(cars)
  end

  def race_time
    race_logic.time
  end

end