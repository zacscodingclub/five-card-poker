require 'rails_helper'

RSpec.describe Player, type: :model do
  it "is valid with a name when built with a game" do
    zac = Player.new(name: "Zac")
    roxanne = Player.new(name: "Roxanne")

    game = Game.new(name: "Game 1", players: [ zac, roxanne ])

    expect(roxanne).to be_valid
    expect(zac).to be_valid
  end

  it "is invalid with a name when built without a game" do
    player = Player.new(name: "Zac")
    player.valid?

    expect(player.errors[:game]).to include("must exist")
  end

  it "is invalid without a name" do
    player = Player.new(name: nil)
    player.valid?

    expect(player.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a name when built without a game" do
    player = Player.new(name: nil)
    player.valid?

    expect(player.errors[:game]).to include("must exist")
  end
end
