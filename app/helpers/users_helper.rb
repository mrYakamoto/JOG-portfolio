module UsersHelper
  def current_admin?
    session[:admin]
  end
end
