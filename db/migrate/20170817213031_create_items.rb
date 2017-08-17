class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table  :items do |t|
    	t.string  :name
    	t.float   :price
    	t.integer :restaurant_id
    	t.integer :type_id

      t.timestamps
    end
  end
end
