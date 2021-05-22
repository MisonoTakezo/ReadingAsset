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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
