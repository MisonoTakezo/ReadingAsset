# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                                                :bigint           not null, primary key
#  name(名前)                                                        :string(100)      not null
#  email(メールアドレス)                                             :string(100)      not null
#  introduction(自己紹介)                                            :text(65535)
#  password_digest(パスワードハッシュ値)                             :string(255)      not null
#  password_reset_token(パスワード再設定トークン)                    :string(255)      not null
#  password_reset_token_expired_at(パスワード再設定トークン有効期限) :datetime
#  profile_image(プロフィール画像)                                   :string(255)
#  verification_token(有効化トークン)                                :string(255)
#  verification_token_expired_at(有効化トークン有効期限)             :datetime
#  created_at                                                        :datetime         not null
#  updated_at                                                        :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  has_many :user_remembers, dependent: :destroy
  has_many :posts, dependent: :destroy

  mount_uploader :profile_image, UserProfileImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }, on: :create

  validates :password, length: { minimum: 8, maximum: 50 }, on: :create
  validates :name, presence: true, length: { maximum: 50 }, on: [:create, :update]

  enum status: { unverified: 0, verified: 1, deleted: 2 }, _prefix: true

  before_create do
    self.verification_token = new_token
  end

  after_create do
    VerifyUserMailer.verify(self).deliver
  end

  def verify_by(token)
    if token == self.verification_token
      update(status: :verified)
    end
  end

  def remember_authenticated?(token)
    return false if remembers.blank?

    remembers.any? do |remember|
      BCrypt::Password.new(remember.token_digest).is_password?(token)
    end
  end

  private
    def new_token
      SecureRandom.urlsafe_base64
    end
end
