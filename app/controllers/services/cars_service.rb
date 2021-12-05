class CarsService
  def create(car_params)
    car = Car.new car_params
    car.save
  end

  def update(car, car_params)
    car.update car_params
    car.save
  end
end
