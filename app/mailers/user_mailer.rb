class UserMailer < ApplicationMailer
  def confirmation_instructions(user)
    @user = user.decorate
    @confirmation_url = confirm_user_url(@user, confirmation_token: @user.confirmation_token)
    mail to: user.email
  end
end
