class CarsService
  def create(car_params)
    car = Car.new car_params
    car.save

    car
  end

  def update(car, car_params)
    car.update car_params
    car.save
  end

  def car_filter
    car_filter ||= CarFilter.new
  end
end
