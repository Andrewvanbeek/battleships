class GamesController < ApplicationController

  def index
  end

  def new
    @ship_1 = Ship.new
    # @ship_2 = Ship.new
    # @ship_3 = Ship.new
    # @ship_4 = Ship.new
    # @ship_5 = Ship.new
    @shot = Shot.new
    @game = Game.new

    render :new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      render :new
    end

  end

  def show
    @game = Game.find(params[:id])

    render :show
  end

  private

  def game_params
    params.require(:game).permit(:player1_id, :player2_id)
  end
end

