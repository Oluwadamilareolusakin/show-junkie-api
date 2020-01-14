class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :show
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :show
  end
end
