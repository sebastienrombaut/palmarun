class RemoveDateFromRacesAndAddDateToResults < ActiveRecord::Migration[5.2]
  def change
    remove_column :races, :date
    add_column :results, :date, :datetime
  end
end
