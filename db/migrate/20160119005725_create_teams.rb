class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false, unique: true
      t.string :abbr, null: false, unique: true
      t.string :stadium_zip, null: false

      t.timestamps null: false
    end
  end
end
