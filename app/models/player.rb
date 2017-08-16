class Player < ApplicationRecord
  belongs_to :game
  has_many :hands

  validates :name, presence: true

  def current_hand
    hands.last
  end

  def current_hand_rank
    current_hand.to_poker_hand.rank
  end
end
