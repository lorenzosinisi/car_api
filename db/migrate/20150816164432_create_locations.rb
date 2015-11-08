class CreateLocations < ActiveRecord::Migration
  def change   
    create_table :locations do |t|
      t.integer :vehicle_count
      t.float :latitude
      t.float :longitude
      t.boolean :restrictedp
      t.string :description
      t.integer :market_id
      t.integer :location_id
      t.integer :has_vans
      t.integer :zipfleet_id
      t.timestamps null: false
    end
  end
end
