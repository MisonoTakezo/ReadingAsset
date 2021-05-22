# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                    :bigint           not null, primary key
#  name(名前)                            :string(100)      not null
#  email(メールアドレス)                 :string(100)      not null
#  introduction(自己紹介)                :text(65535)      not null
#  password_digest(パスワードハッシュ値) :string(100)      not null
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
end
