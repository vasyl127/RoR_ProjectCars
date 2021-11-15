class Race < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 5}

  has_many :race_cars, dependent: :destroy
  has_many :cars, through: :race_cars
end
