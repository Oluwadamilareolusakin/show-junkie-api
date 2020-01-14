class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
      t.string :message
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
