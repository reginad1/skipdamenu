class CreateItemtypes < ActiveRecord::Migration[5.1]
  def change
    create_table :itemtypes do |t|
    	t.integer :item_id
    	t.integer :type_id
      t.timestamps
    end
  end
end
