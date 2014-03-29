class CreatePhysicalItems < ActiveRecord::Migration
  def change
    create_table :physical_items do |t|
      t.decimal :height
      t.decimal :weight
      t.decimal :width

      t.timestamps
    end
  end
end
