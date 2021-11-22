require_relative 'services/filter/filter'
require_relative 'services/trash_service'

class TrashController < ApplicationController
  before_action :cars, :races, :set_car, :set_race

  def index; end

  def restore_car
    flash[:success] = "#{@car.name} restored!" if trash_service.restrore(@car)
    redirect_to trash_path
  end

  def restore_race
    flash[:success] = "#{@race.name} restored!" if trash_service.restrore(@race)
    redirect_to trash_path
  end

  delegate :trash_car, to: :trash_service

  delegate :trash_race, to: :trash_service

  def clean
    trash_service.destroy_items_in_trash
    redirect_to trash_path
  end

  private

  def car_filter
    car_filter ||= CarFilter.new
  end

  def race_filter
    race_filter ||= RaceFilter.new
  end

  def trash_service
    trash_service ||= TrashService.new
  end

  def cars
    @cars = car_filter.cars_deleted
  end

  def races
    @races = race_filter.races_deleted
  end

  def set_car
    @car = car_filter.car_by_id(params[:id])
  end

  def set_race
    @race = race_filter.race_by_id(params[:id])
  end
end
