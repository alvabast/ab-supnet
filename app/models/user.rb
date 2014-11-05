#"name", "last_name", "email", "password", "password_salt", "login"
#"date_of_birth", "created_at", "updated_at"

class User < ActiveRecord::Base
  before_create :encrypt_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :login, presence: true, uniqueness: true

  has_one    :company

  def self.authenticate(email_or_login, password)
    for by_x in [:email, :login]
      user = find_by(by_x=>email_or_login)
      if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
        return user
      end
    end
    return nil
  end

  def encrypt_password
    puts 'aah1'
    if password.present?
      puts 'aah2'
      self.password_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
