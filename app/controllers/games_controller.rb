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
    @game = Game.new(game_params)

    if @game.save
      @game.deal
      redirect_to @game
    else
      render :new
    end
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
