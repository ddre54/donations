class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :title
      t.text :description
      t.references :user
      t.references :donable, polymorphic: true

      t.timestamps
    end

    add_index :donations, [:donable_id, :donable_type]
  end
end
