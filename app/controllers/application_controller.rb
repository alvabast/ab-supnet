class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception


  # Ensure requests are authenticated with a token
  before_action :require_login

  private
  def require_login
    @current_session = valid_session?()
    if @current_session
      @current_session.reload_token!()
      @current_user = @current_session.user
    else
      flash[:notification] = "You must be logged in to access this section"
      flash[:come_from] = request.original_url
      redirect_to :controller=>'account', :action => 'login_page'  # halts request cycle
    end
  end

  def valid_session?()
      return Session.get_if_token_valid(session[:user_token])
  end
end