class GamesController < ApplicationController

  def index
  end

  def new
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
