class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :song_id, foreign_key: true
      t.references :post_tran_id, foreign_key: true
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
