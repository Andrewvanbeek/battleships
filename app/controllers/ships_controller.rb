class ShipsController < ApplicationController
  def create
    if request.xhr?
      params
      @ship = Ship.new()
    end
  end

  private


end