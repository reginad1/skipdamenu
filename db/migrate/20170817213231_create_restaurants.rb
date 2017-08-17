class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.string :location
    	t.float  :longitude
    	t.float  :latitude
    
      t.timestamps
    end
  end
end
