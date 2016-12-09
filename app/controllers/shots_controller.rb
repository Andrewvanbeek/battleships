class ShotsController < ApplicationController
  def create
    if request.xhr?
      @user = User.find_by(id: session[:user_id])
      @game = Game.find_by(id: params[:game_id])
      @shot = Shot.create(shot_params)
      @game.shots << @shot
      @user.shots << @shot
      @game.save
      @user.save
      if @user == @game.player1
        @game.player2_ships.each do |ship|
          if ship.x_coord == @shot.x_coord && ship.y_coord == @shot.y_coord
            ship.hit_count += 1
            ship.save
            @shot.ship = ship
            @shot.hit = true
            @shot.save
          end
        end
      elsif @user == @game.player2
        @game.player1_ships.each do |ship|
          if ship.x_coord == @shot.x_coord && ship.y_coord == @shot.y_coord
            ship.hit_count += 1
            ship.save
            @shot.ship = ship
            @shot.hit = true
            @shot.save
          end
        end
      else
      end
      if @user == @game.player1
     render json: { hit_ships: @game.player2_dead_ships
      }, status: 201
    elsif @user == @game.player2
        render json: { hit_ships: @game.player1_dead_ships
      }, status: 201
    end
    end
  end

  private

  def shot_params
    params.require(:shot).permit(:x_coord, :y_coord)
  end


end
