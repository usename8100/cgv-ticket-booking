class CreateCinemaSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :cinema_seats do |t|
      t.integer :row
      t.integer :seat_no
      t.integer :screen_id
      t.integer :price

      t.timestamps
    end
  end
end
