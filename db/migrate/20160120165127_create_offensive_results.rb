class CreateOffensiveResults < ActiveRecord::Migration
  def change
    create_table :offensive_results do |t|
      t.integer :passing_att, default: 0
      t.integer :passing_comp, default: 0
      t.integer :passing_yds, default: 0
      t.integer :passing_td, default: 0
      t.integer :passing_int, default: 0
      t.integer :passing_2pt, default: 0
      t.integer :rushing_att, default: 0
      t.integer :rushing_yds, default: 0
      t.integer :rushing_td, default: 0
      t.integer :rushing_2pt, default: 0
      t.integer :receiving_tar, default: 0
      t.integer :receiving_rec, default: 0
      t.integer :receiving_yds, default: 0
      t.integer :receiving_td, default: 0
      t.integer :receiving_2pt, default: 0
      t.integer :fumbles_fl, default: 0
      t.integer :fumbles_td, default: 0
      t.integer :returns_ko, default: 0
      t.integer :returns_pnt, default: 0
      t.belongs_to :matchup, null: false

      t.timestamps null: false
    end

    add_index :offensive_results, :matchup_id
  end
end
