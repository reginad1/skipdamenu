class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.string :google_id
      t.string :foursq_id
    	t.float  :longitude
    	t.float  :latitude

      t.timestamps
    end
  end
end
