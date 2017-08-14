class Game < ApplicationRecord
  has_many :players
  has_many :hands, through: :players
  accepts_nested_attributes_for :players

  validates :name, presence: true, uniqueness: true
  validate :number_of_players

  def number_of_players
    errors.add(:players, "must have 2 players at minimum") if players.size < 2
  end

end
