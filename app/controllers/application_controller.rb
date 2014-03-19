class ApplicationController < ActionController::Base

  include TheRole::Controller

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied
    flash[:error] = t('the_role.access_denied')
    redirect_to(:back)
  end

  def render_403
    render file: "public/403.html", status: 403
  end

  def render_404
    render file: "public/404.html", status: 404
  end

  def not_found
    render_404
  end

  def set_current_user
    User.current = current_user
  end

end
