class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.datetime :date
      t.float :distance
      t.integer :height_difference

      t.timestamps
    end
  end
end
