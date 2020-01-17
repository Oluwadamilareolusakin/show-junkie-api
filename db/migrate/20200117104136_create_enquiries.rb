class CreateEnquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :enquiries do |t|
      t.string :message
      t.references :user, null: false, foreign_key: true
    end
  end
end
