class HandsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game.deal

    redirect_to @game
  end
end
