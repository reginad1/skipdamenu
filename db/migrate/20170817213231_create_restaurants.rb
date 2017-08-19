class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.string :google_id
      t.string :foursq_id
    	t.string  :longitude
    	t.string  :latitude

      t.timestamps
    end
  end
end
