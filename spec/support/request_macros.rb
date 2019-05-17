module DeviseRequestSpecHelpers
  include Warden::Test::Helpers

  def login_user
    user = User.create(email: 'nhung@example.com', password: 'password', password_confirmation: 'password')
    login(user)
  end

  def login(resource_or_scope, resource = nil)
    resource ||= resource_or_scope
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    login_as(resource, scope: scope)
  end

  def logout(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    logout(scope)
  end
end