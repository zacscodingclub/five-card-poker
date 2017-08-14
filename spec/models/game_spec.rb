require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "Validations: " do
    it "is valid with a name and at least two players" do
      game = Game.new(
        name: "Game 1",
        players: [
          Player.create(name: "Zac"),
          Player.create(name: "Roxanne")
        ]
      )

      expect(game).to be_valid
    end

    it "is invalid without a name" do
      game = Game.create

      game.valid?
      expect(game.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a unique name" do
      game_1 = Game.new(name: "Game 1")
      game_1.players.build(name: "Zac")
      game_1.players.build(name: "Roxanne")

      game_2 = Game.new(name: "Game 1")
      game_1.save
      game_2.valid?
      expect(game_2.errors[:name]).to include("has already been taken")
    end

    it "is invalid with only 1 player" do
      game = Game.new(name: "Game 1")
      game.players.build(name: "Zac")

      game.valid?
      expect(game.errors[:players]).to include("must have 2 players at minimum")
    end

    it "is invalid with zero players" do
      game = Game.create(name: "Game 1")

      game.valid?
      expect(game.errors[:players]).to include("must have 2 players at minimum")
    end

    it "is invalid with non-unique player names"
  end

  describe "Gameplay: " do

  end
end
