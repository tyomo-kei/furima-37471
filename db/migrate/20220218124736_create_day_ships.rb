class CreateDayShips < ActiveRecord::Migration[6.0]
  def change
    create_table :day_ships do |t|

      t.timestamps
    end
  end
end
