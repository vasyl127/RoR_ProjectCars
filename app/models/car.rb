class Car < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :max_rpm, presence: true, length: { minimum: 3 }
  validates :max_gear, presence: true, length: { minimum: 1 }
  validates :max_speed, presence: true, length: { minimum: 2 }
  validates :torque, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }

  has_many :race_cars, dependent: :destroy
  has_many :races, through: :race_cars
end
