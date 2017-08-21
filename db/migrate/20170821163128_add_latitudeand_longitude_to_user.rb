class AddLatitudeandLongitudeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :zip, :string
    add_column :users, :city, :string
    add_column :users, :google_id, :string
    add_column :users, :name, :string
  end
end
