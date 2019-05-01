class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :song_id
      t.integer :post_trans_id
      t.integer :user_id

      t.timestamps
    end
  end
end
