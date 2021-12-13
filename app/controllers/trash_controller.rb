require_relative 'services/filter/filter'
require_relative 'services/trash_service'

class TrashController < ApplicationController
  before_action :cars, :races, only: %i[index restore_all clean_all trash_present?]
  before_action :set_car, only: %i[restore_car trash_car]
  before_action :set_race, only: %i[restore_race trash_race]

  def index
  @trash_service = trash_service
  end

  def restore_all
    trash_service.restrore_all
    redirect_to trash_path
  end

  def restore_car
    flash[:success] = "#{@car.name} restored!" if trash_service.restrore_obj(@car)
    redirect_to trash_path
  end

  def restore_race
    flash[:success] = "#{@race.name} restored!" if trash_service.restrore_obj(@race)
    redirect_to trash_path
  end

  delegate :trash_car, to: :trash_service

  delegate :trash_race, to: :trash_service

  delegate :have_obj?, to: :trash_service

  delegate :empty_bin, to: :trash_service

  def empty_bin
    clean_all if have_obj?
  end

  def clean_all
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
