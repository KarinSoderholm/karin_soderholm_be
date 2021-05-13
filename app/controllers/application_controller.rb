# class ApplicationController < ActionController::API
class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  helper_method :cart,
                :current_user,
                :current_admin?,
                :find_twitter,
                :find_instagram,
                :find_linked_in,
                :find_pinterest

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_user
    render file: 'public/404', status: 404 unless current_user
  end

  def require_admin
    render file: 'public/404', status: 404 unless current_admin?
  end

  def exclude_admin
    render file: 'public/404', status: 404 if current_admin?
  end

  def generate_flash(resource)
    resource.errors.messages.each do |validation, message|
      flash[validation] = "#{validation}: #{message}"
    end
  end

  def find_linked_in
    social = Social.first
    if !social.linked_in.empty?
      return true
    else
      return false
    end
  end

  def find_twitter
    social = Social.first
    if !social.twitter.empty?
      return true
    else
      return false
    end
  end

  def find_instagram
    social = Social.first
    if !social.instagram.empty?
      @instagram = social.instagram
      return @instagram
      return true
    else
      return false
    end
  end

  def find_pinterest
    social = Social.first
    if !social.pinterest.empty?
      @pinterest = social.pinterest
      return @pinterest
    else
      return false
    end
  end
end
