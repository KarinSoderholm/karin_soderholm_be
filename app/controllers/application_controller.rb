class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include CurrentUserConcern
  skip_before_action :verify_authenticity_token
  around_action :set_time_zone, if: :current_user

  helper_method :cart,
                :current_user,
                :current_admin?,
                :find_twitter,
                :find_instagram,
                :find_linked_in,
                :find_pinterest,
                :guest_user

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    # super || guest_user
    # super || @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def guest_user
    @guest_user ||= GuestUser.new('Guest User', 'guest@example.com')
    OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
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
    resource.errors.messages.map do |validation, message|
      flash[:error] = "The #{validation} #{message.first}"
      # flash[validation] = "#{validation}: #{message}"
    end
  end

  def find_linked_in
    social = find_social
    if !social.linked_in.nil?
      return true
    else
      return false
    end
  end

  def find_twitter
    social = find_social
    if !social.twitter.nil?
      return true
    else
      return false
    end
  end

  def find_instagram
    social = find_social
    if !social.instagram.nil?
      @instagram = social.instagram
      return @instagram
      return true
    else
      return false
    end
  end

  def find_pinterest
    social = find_social
    if !social.pinterest.nil?
      @pinterest = social.pinterest
      return @pinterest
    else
      return false
    end
  end

  def find_social
    Social.first
  end

  private

  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
