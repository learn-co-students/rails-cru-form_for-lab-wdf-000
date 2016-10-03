class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist_id
      t.string :integer
      t.string :genre_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
