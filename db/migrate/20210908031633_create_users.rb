class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.date :date_of_birth
      t.boolean :gender
      t.integer :city_id
      t.string :favorite_cinema

      t.timestamps
    end
  end
end
