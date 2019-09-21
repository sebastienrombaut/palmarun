class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :general_classification
      t.integer :race_id
      t.integer :user_id
      t.integer :running_time

      t.timestamps
    end
  end
end
