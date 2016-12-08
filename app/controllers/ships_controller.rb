class ShipsController < ApplicationController
  def create
    if request.xhr?
      p params
    end
  end
end