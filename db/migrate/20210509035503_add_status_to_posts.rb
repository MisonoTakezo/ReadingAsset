class AddStatusToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :status, :integer, default: 1, null: false, comment: "1: visible, 2: deleted"
  end
end
