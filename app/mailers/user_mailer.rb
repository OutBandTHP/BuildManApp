class UserMailer < ApplicationMailer
  
  def account_activation(user)
    @user = user
    I18n.locale = @user.language
    mail(
      to:      user.email,
      subject: I18n.t('user_mailer.account_activation.subject')
    )
  end

  def password_reset(user)
    @user = user
    I18n.locale = @user.language
    mail(
      to:            @user.email,
      subject:       I18n.t('user_mailer.password_reset.subject')      )
  end
end