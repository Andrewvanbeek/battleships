class ShotsController < ApplicationController
  def create
    if request.xhr?
      @user = User.find(session[:user_id])
      @game = Game.find(params[:game_id])
      @shot = Shot.new(shot_params)
      @shot.user_id = @user.id
      @shot.game_id = @game.id

      if @user == @game.player1
        @game.player2_ships.each do |ship|
          puts [ship.x_coord..(ship.x_coord + ship.size)]
          puts [ship.x_coord..(ship.x_coord + ship.size)].include?(@shot.x_coord)
          if [ship.x_coord].include?(@shot.x_coord) && [ship.y_coord..(ship.y_coord + ship.size)].include?(@shot.y_coord)
            ship.hit_count += 1
            ship.save
            # @shot.ship = ship
            @shot.hit = true
            if @shot.hit
              @shot.save
              break
            end
          else
            @shot.hit = false
          end
        end
        @shot.save
      elsif @user == @game.player2
        @game.player1_ships.each do |ship|
          if [ship.x_coord].include?(@shot.x_coord) && [ship.y_coord..(ship.y_coord + ship.size)].include?(@shot.y_coord)
            ship.hit_count += 1
            ship.save
            # @shot.ship = ship
            @shot.hit = true
            if @shot.hit
              @shot.save
              break
            end
          else
            @shot.hit = false
          end
          @shot.save
        end
      end
      status 200
    end
  end

  private

  def shot_params
    params.require(:shot).permit(:x_coord, :y_coord)
  end


end
