class CreatePostPoems < ActiveRecord::Migration[5.2]
  def change
    create_table :post_poems do |t|
      t.references :song, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
