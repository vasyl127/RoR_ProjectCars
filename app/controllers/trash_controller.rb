require_relative "services/filter"
require_relative "services/trash_service"

class TrashController < ApplicationController
    before_action :cars, :races, :set_car, :set_race

    def index
    end

    def restore_car
        flash[:success] =  "#{@car.name} restored!" if trash_service.restrore(@car)
        redirect_to trash_path
    end

    def restore_race
      flash[:success] =  "#{@race.name} restored!" if trash_service.restrore(@race)
      redirect_to trash_path
    end

    def clean
        # TrashCleanMailer.clean_trash.deliver_later
        trash_service.destroy_items_in_trash
        redirect_to trash_path
    end

    private

    def filter
        @filter ||= Filter.new
    end

    def trash_service
        @trash_service ||= TrashService.new
    end

    def cars
        @cars = filter.cars_deleted
    end

    def races
        @races = filter.races_deleted
    end

    def set_car
        @car = filter.car_by_id(params[:id])
    end
    
    def set_race
        @race = filter.race_by_id(params[:id])
    end
end
