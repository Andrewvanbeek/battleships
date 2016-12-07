class GamesController < ApplicationController
  def new
    @shot = Shot.new
  end

end