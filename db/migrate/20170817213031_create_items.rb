class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table  :items do |t|
    	t.string  :name
    	t.string  :price
      t.string  :description
    	t.integer :restaurant_id
      t.string :entry_id
      t.timestamps
    end
  end
end
