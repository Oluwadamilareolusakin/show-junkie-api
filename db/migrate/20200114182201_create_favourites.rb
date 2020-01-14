class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :show_id

      t.timestamps
    end
    add_index :favourites, :show_id 
  end
end
