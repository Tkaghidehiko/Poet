class AddPoemToPostPoems < ActiveRecord::Migration[5.2]
  def change
    add_column :post_poems, :poem, :text
  end
end
