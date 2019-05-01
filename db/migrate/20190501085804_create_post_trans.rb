class CreatePostTrans < ActiveRecord::Migration[5.2]
  def change
    create_table :post_trans do |t|
      t.text :song_translate
      t.integer :post_poem_id
      t.integer :user_id

      t.timestamps
    end
  end
end
