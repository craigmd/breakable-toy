class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :full_name, null: false
      t.string :position, null: false
      t.string :eligibility_flag, default: "0"
      t.string :image, default: "/fallback/default-player-img.png"
      t.belongs_to :team, null: false

      t.timestamps null: false
    end

    add_index :players, :full_name
    add_index :players, :team_id
    add_index :players, [:full_name, :position, :team_id], unique: true
  end
end
