class CreateOffensiveResults < ActiveRecord::Migration
  def change
    create_table :offensive_results do |t|
      t.integer :passing_att, null: false, default: 0
      t.integer :passing_comp, null: false, default: 0
      t.integer :passing_yds, null: false, default: 0
      t.integer :passing_td, null: false, default: 0
      t.integer :passing_int, null: false, default: 0
      t.integer :passing_2pt, null: false, default: 0
      t.integer :rushing_att, null: false, default: 0
      t.integer :rushing_yds, null: false, default: 0
      t.integer :rushing_td, null: false, default: 0
      t.integer :rushing_2pt, null: false, default: 0
      t.integer :receiving_tar, null: false, default: 0
      t.integer :receiving_rec, null: false, default: 0
      t.integer :receiving_yds, null: false, default: 0
      t.integer :receiving_td, null: false, default: 0
      t.integer :receiving_2pt, null: false, default: 0
      t.integer :fumbles_fl, null: false, default: 0
      t.integer :fumbles_td, null: false, default: 0
      t.integer :returns_ko, null: false, default: 0
      t.integer :returns_pnt, null: false, default: 0
      t.belongs_to :matchup, null: false

      t.timestamps null: false
    end

    add_index :offensive_results, :matchup_id
  end
end
