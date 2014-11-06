TOKEN_VALID = 10 * 60

class AccountController < ApplicationController
  def index
  end

  def login
    login = params[:login]  # login or email
    password = params[:password]

    if login && password
      @user = User.authenticate(login, password)
      if @user
        session = Session.find_by(user:@user)
        session.delete if session != nil
        new_session = Session(user:@user, valid_seconds:TOKEN_VALID).save()

        msg = {token: new_session.token}
        respond_to do |format|
          format.html { render text: msg[:token] }
          format.json { render json: msg }
        end
        # return new_session.token
      else
        ;
        # Username/Pwd does not exist
      end
    else
      ;
      # redirect to login page
    end
  end

  def logout
    authenticate_or_request_with_http_token do |token, options|
      session = Session.find_by(:token=>token)
      session.delete if session != nil
    end
    msg = { status: "OK" }
    respond_to do |format|
      format.html { render text: msg[:status] }
      format.json { render json: msg }
    end
  end
end
