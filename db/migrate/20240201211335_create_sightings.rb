class CreateSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.string :latitude
      t.string :longitude
      t.string :date
      t.timestamps
    end
  end
end
