class CreatePostTrans < ActiveRecord::Migration[5.2]
  def change
    create_table :post_trans do |t|
      t.text :song_translate
      t.references :post_poem, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
