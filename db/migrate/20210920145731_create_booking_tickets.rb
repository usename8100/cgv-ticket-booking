class CreateBookingTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_tickets do |t|
      t.integer :seat_quantity
      t.integer :user_id
      t.integer :show_id
      t.boolean :status
      t.date :create_at
      t.integer :food_total_price
      t.integer :seat_total_price
      t.integer :total

      t.timestamps
    end
  end
end
