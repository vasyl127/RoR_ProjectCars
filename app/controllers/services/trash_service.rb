require_relative 'filter/car_filter'
require_relative 'filter/race_filter'

class TrashService
  def restrore_obj(obj)
    obj.update deleted: 0
    obj.save
  end

  def restrore_all
    car_filter.cars_deleted.update deleted: 0
    race_filter.races_deleted.update deleted: 0
  end

  def trash_car(car)
    # race_id
    car.races.delete_all
    # fix
    car.update deleted: 1
    car.save
  end

  def trash_race(race)
    # race_id
    race.cars.delete_all
    # fix
    race.update deleted: 1
    race.save
  end

  def destroy_items_in_trash
    car_filter.find_deleted.delete_all
    race_filter.find_deleted.delete_all
  end

  def have_obj?
    car_filter.find_deleted.present? or race_filter.find_deleted.present?
  end

  private

  def car_filter
    car_filter ||= CarFilter.new
  end

  def race_filter
    race_filter ||= RaceFilter.new
  end
end
