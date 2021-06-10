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
class UserRemember < ApplicationRecord
  belongs_to :user, optional: true

  attr_accessor :token

  before_create do
    self.token = new_token
    self.token_digest = digest(self.token)
  end

  private

    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end
