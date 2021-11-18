class TrashController < ApplicationController
    before_action :filter_init, :deleted_cars, :deleted_races

    def index
        
    end

    private

    def filter_init
        @filter = Filter.new
    end

    def deleted_cars
        @cars = @filter.cars_deleted
    end

    def deleted_races
        @races = @filter.races_deleted
    end
end
