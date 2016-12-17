class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birthdate
      t.integer :no_cases
      t.string :bloodtype
      t.string :id_no
      t.string :email
      t.string :password
      t.string :address

      t.timestamps
    end
  end
end
