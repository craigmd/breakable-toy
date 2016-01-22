class CreateDefensiveResults < ActiveRecord::Migration
  def change
    create_table :defensive_results do |t|
      t.integer :sack, null: false, default: 0
      t.integer :int, null: false, default: 0
      t.integer :int_td, null: false, default: 0
      t.integer :saf, null: false, default: 0
      t.integer :fumble_rec, null: false, default: 0
      t.integer :fumble_td, null: false, default: 0
      t.integer :punt_blk, null: false, default: 0
      t.integer :pa, null: false, default: 0
      t.belongs_to :matchup, null: false

      t.timestamps null: false
    end

    add_index :defensive_results, :matchup_id
  end
end
