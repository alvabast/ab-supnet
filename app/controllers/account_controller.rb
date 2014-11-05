class AccountController < ApplicationController
  def index
  end
  
  def login
    # if user & password present:
      # If valid: (re)generate token, add to db with 10 minutes and redirect to main page
      # If not return False & message (+ eventually log event)
    # else
      # redirect to login page
  end
end
