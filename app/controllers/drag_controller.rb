class DragController < ApplicationController

  def index
    @cars = Car.all
  end

end
