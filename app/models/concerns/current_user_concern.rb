module CurrentUserConcern
  extend ActiveSupport::Concern
  def current_user
    super || guest_user
  end

  def guest_user(name='Guest User', email='guest@example.com')
    @guest = GuestUser.new
    # guest.name = name
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    # guest.email = email
    guest.email = "guest@example.com"
    guest
  end
end
