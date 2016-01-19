class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :year, null: false
      t.string :week, null: false

      t.timestamps null: false
    end
  end
end
