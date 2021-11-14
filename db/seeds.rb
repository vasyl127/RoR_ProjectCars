# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Race.create(name:'Race #1', description: 'Test Race #1')
Race.create(name:'Race #2', description: 'Test Race #2')

Car.create(name:'Car #1', description: 'Test Car #1', max_rpm: 8000, torque: 4100, max_gear: 8, max_speed: 210)
Car.create(name:'Car #2', description: 'Test Car #2', max_rpm: 7000, torque: 3100, max_gear: 7, max_speed: 190)
Car.create(name:'Car #3', description: 'Test Car #3', max_rpm: 6000, torque: 2800, max_gear: 6, max_speed: 170)
Car.create(name:'Car #4', description: 'Test Car #4', max_rpm: 5000, torque: 1900, max_gear: 5, max_speed: 150)
