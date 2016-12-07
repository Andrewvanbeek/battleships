class ShotsController < ApplicationController
  def create
    if request.xhr?
      @shot = Shot.create(x_coord: 4, y_coord: 4)
     render json: { hey: "hello"
}, status: 201
    end
  end

  def index
    @shots = Shot.all
         render json: { hey: @shots.length
}, status: 201
  end
end