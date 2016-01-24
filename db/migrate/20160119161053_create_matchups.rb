class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.string :dk_salary, null: false
      t.belongs_to :team, null: false
      t.belongs_to :player, null: false
      t.belongs_to :period, null: false

      t.timestamps null: false
    end

    add_index :matchups, :team_id
    add_index :matchups, :player_id
    add_index :matchups, :period_id
    add_index :matchups, [:team_id, :player_id, :period_id], unique: true
  end
end
