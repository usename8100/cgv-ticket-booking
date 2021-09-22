class CreateCinemas < ActiveRecord::Migration[6.1]
  def change
    create_table :cinemas do |t|
      t.string :name
      t.integer :total_screen
      t.integer :city_id

      t.timestamps
    end
  end
end
