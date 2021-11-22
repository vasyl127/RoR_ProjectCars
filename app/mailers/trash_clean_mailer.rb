require_relative '../controllers/services/filter'

class TrashCleanMailer < ApplicationMailer
  before_action :check_adm_email, :filter_init

  def clean_trash
    @cars = @filter.cars_deleted
    @races = @filter.races_deleted
    mail to: @admin_email, subject: 'Trash clean | PRJ_CAR'
  end

  private

  def check_adm_email
    @admin_email = 'admin@example.com'
  end

  def filter_init
    @filter = Filter.new
  end

  # def set_cars
  #     @cars = @filter.cars_deleted
  # end

  # def set_races
  #     @races = @filter.races_deleted
  # end
end
