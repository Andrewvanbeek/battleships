class GamesController < ApplicationController

  def index
    @games = Game.all.find_all {|game| game.ready_to_join == true}
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
    puts session[:user_id]
    @user = User.find_by(id: session[:user_id])
    @game = Game.new(player1_id: @user.id)
    if @game.save
      puts "IT SAVED!"
      redirect_to @game
    else
      puts "$$$$$$$$$$$$$$"
      p @game.errors.full_messages
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

