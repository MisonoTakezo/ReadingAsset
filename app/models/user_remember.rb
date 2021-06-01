class UserRemember < ApplicationRecord
  class User::Remember < ApplicationRecord
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
