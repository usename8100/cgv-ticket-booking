class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :genre_id
      t.integer :length
      t.string :director
      t.text :cast
      t.date :start_date
      t.string :rated
      t.string :language
      t.text :description
      t.text :image_link

      t.timestamps
    end
  end
end
