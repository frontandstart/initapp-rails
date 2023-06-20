class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  def after_sign_in_path_for(resource)
    current_admin ? rails_admin_path : user_path
  end

  private

  def set_locale
    return redirect_to url_for(locale: I18n.default_locale) if wrong_locale?

    I18n.locale = params[:locale]
  end

  def wrong_locale?
    params[:locale].blank? || I18n.available_locales.exclude?(params[:locale].to_sym) 
  end

end
