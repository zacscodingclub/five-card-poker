class Game < ApplicationRecord
  has_many :players
  has_many :hands, through: :players
  accepts_nested_attributes_for :players

  validates :name, presence: true, uniqueness: true
  validate :number_of_players
  validate :unique_player_names

  def deal
    deck = Deck.new
    deck.shuffle

    h1 = PokerHand.new
    h2 = PokerHand.new

    5.times do
      h1.hand << deck.deal
      h2.hand << deck.deal
    end

    players[0].hands.create(cards: h1)
    players[1].hands.create(cards: h2)
  end

  def winner
    players[0].current_hand.to_poker_hand > players[1].current_hand.to_poker_hand ?
      players[0] : players[1]
  end

  private

  def number_of_players
    errors.add(:players, "must have 2 players at minimum") if players.size < 2
  end

  def unique_player_names
    names = players.map { |p| p.name }

    errors.add(:players, "must have unique player names") if names[0] == names[1]
  end
end
