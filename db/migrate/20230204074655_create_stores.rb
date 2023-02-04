class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :store_type
      t.integer :status
    end

    add_index :stores, [:store_type, :status]
  end
end
