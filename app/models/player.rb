class Player < ApplicationRecord
  belongs_to :game
  has_many :hands

  validates :name, presence: true

  # Test
  def current_hand
    hands.last
  end

  # Test
  def current_hand_rank
    hands.last.to_poker_hand.rank
  end
end
