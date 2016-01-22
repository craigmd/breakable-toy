class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false, unique: true
      t.string :alt_abbr, null: false, unique: true
      t.string :std_abbr, null: false, unique: true

      t.timestamps null: false
    end
  end
end
