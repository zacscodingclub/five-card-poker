class CreateHands < ActiveRecord::Migration[5.1]
  def change
    create_table :hands do |t|
      t.jsonb :cards
      t.integer :player_id
      t.timestamps
    end
  end
end
