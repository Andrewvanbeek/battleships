class ShotsController < ApplicationController
  def create
    if request.xhr?
      @user = User.find_by(id: session[:user_id])
      @game = Game.find_by(id: params[:game_id])
      @shot = Shot.create(x_coord: params[:x_coord], x_coord: params[:y_coord], game_id: @game.id, user_id: @user_id)
     render json: {
      }, status: 201
    end
  end

end
