class ApplicationController < ActionController::Base
  include SessionsHelper
  
  before_action :set_i18n_locale_from_params
  before_action :set_language_from_locale
  
  def default_url_options(options={})
    {:locale=>I18n.locale}
  end

  protected
  
   def set_i18n_locale_from_params
     if params[:locale]
       if I18n.available_locales.map(&:to_s).include?(params[:locale])
         I18n.locale = params[:locale]
       else
        flash.now[:notice] = 
        I18n.t('errors.translation', lang: params[:locale].to_s)
        logger.error flash.now[:notice]
       end
     end
   end
   
   def set_language_from_locale
     if logged_in?
       if current_user.language != params[:locale].to_s
         current_user.update(language: params[:locale])
       end
     end 
   end
end
