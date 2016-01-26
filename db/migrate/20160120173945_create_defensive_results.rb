class CreateDefensiveResults < ActiveRecord::Migration
  def change
    create_table :defensive_results do |t|
      t.integer :sack, default: 0
      t.integer :int, default: 0
      t.integer :int_td, default: 0
      t.integer :saf, default: 0
      t.integer :fumble_rec, default: 0
      t.integer :fumble_td, default: 0
      t.integer :punt_blk, default: 0
      t.integer :pa, default: 0
      t.belongs_to :matchup, null: false

      t.timestamps null: false
    end

    add_index :defensive_results, :matchup_id
  end
end
