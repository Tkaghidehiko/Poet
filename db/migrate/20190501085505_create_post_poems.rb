class CreatePostPoems < ActiveRecord::Migration[5.2]
  def change
    create_table :post_poems do |t|
      t.integer :song_id
      t.integer :user_id

      t.timestamps
    end
  end
end
