TOKEN_VALID = 10 * 60

class AccountController < ApplicationController
  skip_before_action :require_login, only: [:login_page, :login]
:error
  def login_page
    @error = flash[:error]
    @notification = flash[:notification]
  end

  def login
    login = params[:login]  # can be login or email
    password = params[:password]

    @user = User.get_by_login_pwd(login, password)
    if @user
      old_session = Session.find_by(user:@user)
      old_session.delete if old_session != nil
      @new_session = Session.new(user:@user, valid_seconds:TOKEN_VALID)

      if @new_session.save()
        session[:user_token] = @new_session.token
        redirect_to :root
      else
        flash[:error] = @new_session.errors
        redirect_to :controller=>'account', :action => 'login_page'
      end
    else
      flash[:error] = 'Username or login does not exist'
      redirect_to :controller=>'account', :action => 'login_page'
    end
  end

  def logout
    @current_session.delete
    session[:user_token] = nil
  flash[:notification] = 'User successfully logged out'
  redirect_to :controller=>'account', :action => 'login_page'  # halts request cycle
  end
end
