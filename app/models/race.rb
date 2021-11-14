class Race < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 5}
end
