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
    if request.xhr?
      if @game.shots == 0
        render json: { ready: @game.ready_to_start, player: @game.player1.username}, status: 201
      elsif @game.who_fired_last == @game.player2
        render json: { ready: @game.ready_to_start, player: @game.player1.username}, status: 201
      else
        render json: { ready: @game.ready_to_start, player: @game.player2.username}, status: 201
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




