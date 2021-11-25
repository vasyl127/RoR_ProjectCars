# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Race.create(name: 'Race #1', description: 'Test Race #1')
Race.create(name: 'Race #2', description: 'Test Race #2')
Race.create(name: 'Race #3', description: 'Test Race #3')

name = 1
max_rpm = 8000
torque = 4100
max_gear = 12
max_speed = 210 

10.times do
  Car.create(name: "Car ##{name.to_s}", description: "Test Car ##{name.to_s}", max_rpm: max_rpm,
    torque: torque, max_gear: max_gear, max_speed: max_speed)
  name += 1
  max_rpm -= 300
  torque -= 200
  max_gear -= 1
  max_speed -= 10
end

