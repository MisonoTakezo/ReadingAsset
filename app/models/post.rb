# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                                                        :bigint           not null, primary key
#  user_id                                                   :bigint
#  book_id                                                   :bigint
#  status(ステータス 0: unverified, 1: verified, 2: deleted) :integer          default("visible"), unsigned, not null
#  impression(感想)                                          :text(65535)
#  created_at                                                :datetime         not null
#  updated_at                                                :datetime         not null
#
# Indexes
#
#  index_posts_on_book_id  (book_id)
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  validates :impression, length: { maximum: 500 }

  belongs_to :book
  belongs_to :user

  enum status: {invisible: 0, visible: 1, deleted: 2 }

  def created_by?(current_user)
    current_user && current_user == user
  end
end
