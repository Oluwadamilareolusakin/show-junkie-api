class DropSuggestions < ActiveRecord::Migration[6.0]
  def change
    drop_table :suggestions
  end
end
