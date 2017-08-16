require 'rails_helper'

RSpec.describe Hand, type: :model do
  before do
    @zac = Player.new(name: "Zac")
    @roxanne = Player.new(name: "Roxanne")

    @game = Game.create(name: "Game 1", players: [ @zac, @roxanne ])
  end

  describe "#format_cards" do
    it "returns an array of strings" do
      @game.deal
      cards = @zac.current_hand.format_cards

      expect(cards).to be_an_instance_of(Array)

      cards.each do |card|
        expect(card).to be_an_instance_of(String)
      end
    end
  end

  describe "#to_poker_hand" do
    it "returns a PokerHand object" do
      @game.deal

      expect(@zac.current_hand.to_poker_hand).to be_an_instance_of(PokerHand)
    end
  end
end
