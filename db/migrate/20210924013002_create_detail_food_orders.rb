class CreateDetailFoodOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :detail_food_orders do |t|
      t.integer :booking_ticket_id
      t.integer :food_id
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end
