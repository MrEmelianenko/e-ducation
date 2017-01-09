class ApplicationController < ActionController::Base
  # Includes
  include Pundit

  # Settings
  protect_from_forgery with: :exception

  # Callbacks
  before_action :authenticate_user!
  before_action :set_locale

  private

  def set_locale
    session[:locale] = params[:locale] if %w(en ru).include?(params[:locale])
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
