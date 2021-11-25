require_relative 'filter'

class CarFilter < Filter
  def cars_all
    Car.where(deleted: 0)
  end

  def cars_deleted
    Car.where(deleted: 1)
  end

  def car_by_id(id)
    Car.find_by id: id
  end
end
