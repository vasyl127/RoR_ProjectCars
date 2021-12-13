require_relative 'filter/car_filter'
require_relative 'filter/race_filter'

class TrashService
  def restrore_obj(obj)
    obj.update deleted: 0
    obj.save
  end

  def restrore_all
    car_filter.find_deleted.update deleted: 0
    race_filter.find_deleted.update deleted: 0
  end

  def trash_car(car)
    # race_id
    # car.races.delete_all
    race_filter.races_for_car(car).delete_all
    car.update deleted: 1
    car.save
  end

  def trash_race(race)
    # race_id
    # race.cars.delete_all
    car_filter.cars_in_race(race).delete_all
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

  def delete_all_obj
    present_obj = have_obj?
    destroy_items_in_trash if present_obj
    present_obj
  end

  private

  def car_filter
    car_filter ||= CarFilter.new
  end

  def race_filter
    race_filter ||= RaceFilter.new
  end
end
