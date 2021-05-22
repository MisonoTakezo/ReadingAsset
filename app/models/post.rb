# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                 :bigint           not null, primary key
#  user_id            :bigint
#  status(ステータス) :integer          default(NULL), unsigned, not null
#  title(タイトル)    :string(100)      not null
#  impression(感想)   :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  validates :title, length: { maximum: 50 }, presence: true
  validates :impression, length: { maximum: 1000 }

  belongs_to :user

  enum status: { visible: 1, deleted: 2 }

  def created_by?(current_user)
    current_user && current_user == user
  end
end
