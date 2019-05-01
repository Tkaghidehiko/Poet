class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :album_name
      t.string :song_name
      t.integer :artist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
