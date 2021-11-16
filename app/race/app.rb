require_relative "race"
require_relative "car/model/car"
require_relative "car/car_controller"

car_model1 = Car.new(name: 'Car #1', max_speed: 210, max_rpm: 8000, torque: 4100, max_gear: 8)
car_model2 = Car.new(name: 'Car #2', max_speed: 210, max_rpm: 8000, torque: 4100, max_gear: 8)
car_model3 = Car.new(name: 'Car #3', max_speed: 160, max_rpm: 6000, torque: 2800, max_gear: 5)
car_model4 = Car.new(name: 'Car #4', max_speed: 160, max_rpm: 6000, torque: 2800, max_gear: 5)

race = Race.new
race.add_car_to_race(CarController.new(car_model1))
race.add_car_to_race(CarController.new(car_model2))
race.add_car_to_race(CarController.new(car_model3))
race.add_car_to_race(CarController.new(car_model4))
race.start_race
