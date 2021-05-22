# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.bigint :user_id
      t.string :title
      t.string :impression

      t.timestamps
    end
  end
end
