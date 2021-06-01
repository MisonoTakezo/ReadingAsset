class VerifyUserMailer < ApplicationMailer
  def verify(user)
    @user = user
    mail(
      to: @user.email,
      subject: "ReadingAsset：メールアドレスのご確認"
    )
  end
end
