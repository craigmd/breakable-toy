class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :full_name, null: false
      t.string :position, null: false
      t.string :dk_number, unique: true
      t.string :eligibility_flag, default: "0"
      t.string :image, default: "default-player-img.png"
      t.belongs_to :team, null: false

      t.timestamps null: false
    end

    add_index :players, :full_name
    add_index :players, :team_id
  end
end
