class ShotsController < ApplicationController
  def create
    if request.xhr?
      p params
      @user = User.find_by(id: session[:user_id])
      @game = Game.find_by(id: params[:game_id])
      @shot = Shot.create(shot_params)
      @game.shots << @shot
      @user.shots << @shot
      @game.save
      @user.save
     render json: { hey: "hello"
      }, status: 201
    end
  end

  private

  def shot_params
    params.require(:shot).permit(:x_coord, :y_coord)
  end


end
