class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start_address
      t.string :destination_address
      t.float :distance
      t.decimal :price, precision: 8, scale: 2
      t.date :date
      t.timestamps null: false
    end
  end
end
