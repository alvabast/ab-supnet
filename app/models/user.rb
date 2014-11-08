# Schema: User(name:string, last_name:string, email:string, password_digest:string,
# =>           login:string, date_of_birth:string, created_at:datetime, updated_at:datetime)

class User < ActiveRecord::Base
  before_save :lowercase_email_login

  validates :name,      presence: true,
                        length: {minimum: 2}

  validates :last_name, presence: true,
                        length: {minimum: 2}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :login, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: {minimum: 3}

  validates :password, length: { minimum: 6 }

  has_secure_password # Manage the password & password_confirmation fields + the encryption + implements authenticate
  has_one    :company

  def self.get_by_login_pwd(email_or_login, password)
    # Get a user by login/email & password, else nil
    for by_x in [:email, :login]
      user = find_by(by_x=>email_or_login).try(:authenticate, password)
      return user if user
    end
    return nil
  end

  def lowercase_email_login
    self.email = email.downcase
    self.login = login.downcase
  end
end
