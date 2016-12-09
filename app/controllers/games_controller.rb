class GamesController < ApplicationController

  def index
    @games = Game.all.find_all {|game| game.ready_to_join == true}
  end

  def new
    @ship_1 = Ship.new
    @shot = Shot.new
    @game = Game.new

    render :new
  end



  def create
    @user = User.find_by(id: session[:user_id])
    if @user
      @game = Game.new(player1_id: @user.id)
      if @game.save
        redirect_to @game
      else
        render :index
      end
    else
      render :index
    end

  end

  def show
    @user = User.find_by(id: session[:user_id])
    @ship_1 = Ship.new
    @shot = Shot.new
    @game = Game.find(params[:id])
    if @game.ready_to_join
      @player2 = User.find(session[:user_id])
      if @player2 != @game.player1
        @game.player2_id = @player2.id
        @game.save
      end
    end
    if request.xhr? && !@game.ready_to_join
      if @game.shots.count == 0 || @game.who_fired_last == @game.player2

        pl_ships = []
        op_ships = []
        pl_shots = []
        op_shots = []
        if @game.player1.id == session[:user_id]
            pl_ships = @game.player1_ships
            pl_shots = @game.player1.shots.where(game_id: @game.id)
            op_ships = @game.player2_ships
            op_shots = @game.player2.shots.where(game_id: @game.id)
          end
        elsif @game.player2.id == session[:user_id]
            pl_ships = @game.player2_ships
            pl_shots = @game.player2.shots.where(game_id: @game.id)
            op_ships = @game.player1_ships
            op_shots = @game.player1.shots.where(game_id: @game.id)
        end

        render json: { gameReady: !@game.ready_to_join, playerShips: pl_ships, opponentShips: op_ships, gameStart: @game.ready_to_start ,player: @game.active_player, playerShots: pl_shots,opponentShots: op_shots} status: 201
      else
        status: 201
      end
    else
      render :show
    end
  end

  private

  def game_params
    params.require(:game).permit(:player1_id)
  end
end




