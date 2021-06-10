class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name, limit: 100, null: false, comment: "著者名"

      t.timestamps
    end
  end
end
