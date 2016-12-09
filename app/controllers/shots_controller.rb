class ShotsController < ApplicationController
  def create
    if request.xhr?
      @shot = Shot.create(x_coord: params[:x_coord], x_coord: params[:y_coord])
     render json: {
      }, status: 201
    end
  end

end
