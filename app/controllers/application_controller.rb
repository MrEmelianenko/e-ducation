class ApplicationController < ActionController::Base
  # Settings
  protect_from_forgery with: :exception

  # Callbacks
  before_action :authenticate_user!
  before_action :load_locale

  private

  def load_locale
    session[:locale] = params[:locale] if %w(en ru).include?(params[:locale])
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
