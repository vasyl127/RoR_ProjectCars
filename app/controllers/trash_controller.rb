require_relative "services/filter"


class TrashController < ApplicationController
    before_action :filter_init, :deleted_cars, :deleted_races, :set_car, :set_race

    def index
    end

    def restore_car
        @car.deleted = 0
        @car.save
        flash[:success] = 'Car restored!'
        redirect_to trash_index_path
    
    end

    def restore_race
        @race.deleted = 0
        @race.save
        flash[:success] = 'Race restored!'
        redirect_to trash_index_path
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

    def set_car
        @car = @filter.car_by_id(params[:id])
    end
    
    def set_race
        @race = @filter.race_by_id(params[:id])
    end
    
end
