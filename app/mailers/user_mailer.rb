class UserMailer < ApplicationMailer
  default from: "do_not_reply@conffeed.com"

  def verify(user)
    @user = user
    mail to: @user.email, subject: "[ConfFeed] Verify Email"
  end
end
