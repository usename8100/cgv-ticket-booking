class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.date :date_show
      t.string :start_time
      t.string :end_time
      t.integer :screen_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
