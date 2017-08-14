require 'pry'
class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    2.times { @game.players.build }
  end

  def create
    #binding.pry
    @game = Game.create(game_params)

    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(
      :name,
      players_attributes: [ :name ]
    )
  end
end
