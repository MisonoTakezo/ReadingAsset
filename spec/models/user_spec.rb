# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                                                :bigint           not null, primary key
#  status(ステータス 0:invisible, 1: visible, 2:deleted)             :integer          default("unverified"), unsigned, not null
#  name(名前)                                                        :string(100)      not null
#  email(メールアドレス)                                             :string(100)      not null
#  bio(自己紹介)                                                     :text(65535)
#  password_digest(パスワードハッシュ値)                             :string(255)      not null
#  password_reset_token(パスワード再設定トークン)                    :string(255)
#  password_reset_token_expired_at(パスワード再設定トークン有効期限) :datetime
#  profile_image(プロフィール画像)                                   :string(255)
#  verification_token(有効化トークン)                                :string(255)
#  verification_token_expired_at(有効化トークン有効期限)             :datetime
#  created_at                                                        :datetime         not null
#  updated_at                                                        :datetime         not null
#
require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    let(:user) { FactoryBot.create(:user) }
    it "50文字以下の名前、フォーマットに乗っ取ったメールアドレス、8文字以上50文字以下のパスワードがある場合、有効である" do
      expect(user).to be_valid
    end

    it "名前がない場合は無効である" do
      invalid_user = FactoryBot.build(:user, name: nil)
      expect(invalid_user).to be_invalid
    end

    it "50文字を超える長さの名前は無効である" do
      invalid_name = "name" * 20
      invalid_user = FactoryBot.build(:user, name: invalid_name)
      expect(invalid_user).to be_invalid
    end

    it "emailがない場合は無効である" do
      invalid_user = FactoryBot.build(:user, email: nil)
      expect(invalid_user).to be_invalid
    end

    it "emailが重複する場合は無効である" do
      duplicate_user = FactoryBot.build(:user, email: user.email)
      expect(duplicate_user).to be_invalid
    end

    it "emailのフォーマットに合わない場合は無効である" do
      invalid_email = "example.user@foo.foo@bar_baz.com"
      invalid_user = FactoryBot.build(:user, email: invalid_email)
      expect(invalid_user).to be_invalid
    end

    it "8文字未満のpasswordは無効である" do
      invalid_password = "pass"
      invalid_user = FactoryBot.build(:user, password: invalid_password)
      expect(invalid_user).to be_invalid
    end

    it "50文字を超える長さのパスワードは無効である" do
      invalid_password = "password" * 10
      invalid_user = FactoryBot.build(:user, password: invalid_password)
      expect(invalid_user).to be_invalid
    end
  end
end
