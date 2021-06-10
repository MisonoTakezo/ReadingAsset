class AddBookIdToPosts < ActiveRecord::Migration[5.2]
  def up
    add_reference :posts, :book, null: false, foreign_key: true
  end

  def down
    remove_reference :posts, :book, null: false, foreign_key: true
  end
end
