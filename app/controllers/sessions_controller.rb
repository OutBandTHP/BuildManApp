class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        forwarding_url = session[:forwarding_url]
        reset_session
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        log_in user
        redirect_to forwarding_url || user
      else
        message  = I18n.t('messages.not_activated')
        message += I18n.t('messages.check_mail')
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = I18n.t('errors.invalid_pw')
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end