# == Schema Information
#
# Table name: user_remembers
#
#  id                             :bigint           not null, primary key
#  user_id                        :bigint
#  token_digest(トークンハッシュ) :string(100)      not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
# Indexes
#
#  index_user_remembers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class UserRememberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
