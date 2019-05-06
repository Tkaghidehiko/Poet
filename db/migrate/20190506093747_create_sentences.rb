class CreateSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :sentences do |t|
      t.text :sentence
      t.integer :post_poem_id
      t.integer :user_id

      t.timestamps
    end
  end
end
