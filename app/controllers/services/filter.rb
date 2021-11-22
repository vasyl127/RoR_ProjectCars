require_relative "../../models/car"
require_relative "../../models/race"


class Filter

    def races_for_car(car_id)
        RaceCar.where(car_id: car_id)
    end

    def cars_all
       Car.where(deleted: 0)
    end

    def cars_deleted
        Car.where(deleted: 1)
    end

    def car_by_id(id)
        Car.find_by id: id
    end

    def race_by_id(id)
        Race.find_by id: id
    end

    def races_all
        Race.where(deleted: 0)
    end
    
    def races_deleted
        Race.where(deleted: 1)
    end

end