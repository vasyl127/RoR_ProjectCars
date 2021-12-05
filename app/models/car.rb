class Car < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :max_rpm, presence: true, length: { minimum: 3 }, numericality: { only_integer: true }
  validates :max_gear, presence: true, length: { minimum: 1 }, numericality: { only_integer: true }
  validates :max_speed, presence: true, length: { minimum: 2 }, numericality: { only_integer: true }
  validates :torque, presence: true, length: { minimum: 3 }, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 5 }

  has_many :race_cars, dependent: :destroy
  has_many :races, through: :race_cars
end
