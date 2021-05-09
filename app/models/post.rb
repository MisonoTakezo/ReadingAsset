class Post < ApplicationRecord
  validates :title, length: {maximum: 50}, presence: true
  validates :impression, length: {maximum: 1000}

  belongs_to :user

  enum status: { visible: 1, deleted: 2 }

  def created_by?(current_user)
    return current_user && current_user == user
  end
end
