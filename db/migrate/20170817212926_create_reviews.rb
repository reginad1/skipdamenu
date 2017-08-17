class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table  :reviews do |t|
    	t.string  :body
    	t.integer :user_id
    	t.integer :item_id 
    	t.integer :rating


      t.timestamps
    end
  end
end
