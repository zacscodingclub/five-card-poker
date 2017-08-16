class Hand < ApplicationRecord
  belongs_to :player

  def format_cards
    cards.map do |c|
      Card::FACES[c['face']] + Card::SUITS[c['suit']].upcase
    end
  end

  def to_poker_hand
    PokerHand.new(format_cards)
  end

  def just_cards
    PokerHand.new(format_cards).just_cards.split
  end
end
