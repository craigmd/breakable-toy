class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :year, null: false
      t.string :week, null: false

      t.timestamps null: false
    end

    add_index :periods, [:year, :week], unique: true
  end
end
