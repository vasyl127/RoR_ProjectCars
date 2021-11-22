require_relative 'filter/car_filter'
require_relative 'filter/race_filter'


class TrashService
  def restrore(obj)
    obj.deleted = 0
    obj.save
  end

  def trash_car(car)
    car.races.delete_all
    car.deleted = 1
    car.save
  end

  def trash_race(race)
    race.cars.delete_all
    race.deleted = 1
    race.save
  end

  def destroy_items_in_trash
    car_filter.cars_deleted.delete_all
    race_filter.races_deleted.delete_all
  end

  private

  def car_filter
    car_filter ||= CarFilter.new
  end

  def race_filter
    race_filter ||= RaceFilter.new
  end

end
