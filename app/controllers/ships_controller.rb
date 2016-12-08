class ShipsController < ApplicationController
  def create
    if request.xhr?
      p params
      @user = User.find_by(id: session[:user_id])
      @game = Game.find_by(id: params[:game_id])
      @ship = Ship.new(ship_params)
      puts "cheeky cheese"
      if @ship.save
        @game.ships << @ship
        @user.ships << @ship
        @game.save
        @user.save
        render json: { hey: "hello"}, status: 201
      end
      puts @ship.errors.full_messages
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:x_coord, :y_coord, :classification, :size)
  end


end

