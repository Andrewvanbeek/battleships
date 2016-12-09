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
    render :show
  end

  private

  def game_params
    params.require(:game).permit(:player1_id)
  end
end
