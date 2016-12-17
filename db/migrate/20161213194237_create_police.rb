class CreatePolice < ActiveRecord::Migration[5.0]
  def change
    create_table :police do |t|
      t.string :username
      t.string :password_digest
      t.string :name

      t.timestamps
    end
  end
end
