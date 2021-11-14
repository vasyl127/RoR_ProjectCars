class RaceCar < ApplicationRecord
  validates :car_id, presence: true
  validates :race_id, presence: true

end
