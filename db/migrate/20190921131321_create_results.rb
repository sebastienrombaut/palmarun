class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :general_classification
      t.string :race_id
      t.string :integer
      t.string :user_id
      t.string :integer
      t.integer :running_time

      t.timestamps
    end
  end
end
