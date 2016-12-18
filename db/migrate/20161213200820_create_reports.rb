class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :text
      t.string :video
      t.string :photo
      t.string :sound
      t.integer :personId
      t.boolean :done
      t.string :location
      t.string :x
      t.string :y
      t.string :locsort

      t.timestamps
    end
  end
end
