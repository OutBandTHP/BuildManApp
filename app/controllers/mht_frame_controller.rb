class MhtFrameController < ApplicationController
  def home
    if params[:set_locale]
      redirect_to root_url(locale: params[:set_locale])
    end
  end

  def about
  end

  def contact
  end

  def news
  end

  def help
  end
end
