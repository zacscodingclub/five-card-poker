require 'rails_helper'

RSpec.describe Deck, type: :model do
  before do
    @deck = Deck.new
  end
  describe "#shuffle" do
    it "randomizes the cards" do
      cards = @deck.cards

      @deck.shuffle
      expect(cards).to_not eq(@deck.cards)
    end

    it "returns a full deck" do
      @deck.shuffle

      expect(@deck.size).to eq(52)
    end
  end

  describe "#deal" do
    it "takes one card off top each time" do
      @deck.deal
      expect(@deck.size).to eq(51)
    end

    it "takes one off the card lots of times" do
      50.times { @deck.deal }
      expect(@deck.size).to eq(2)
    end
  end

  describe "#empty" do
    it "accurately determines the deck is not empty" do
      51.times { @deck.deal }
      expect(@deck.empty?).to be(false)
    end

    it "accurately determines the deck is empty" do
      52.times { @deck.deal }
      expect(@deck.empty?).to be(true)
    end
  end
end
