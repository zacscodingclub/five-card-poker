class AddGameIdToPlayersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :game_id, :string
  end
end
