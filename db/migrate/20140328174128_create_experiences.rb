class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :primary_contact_name
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
