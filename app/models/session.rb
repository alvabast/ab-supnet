# user_id, token, valid_seconds, updated_at
class Session < ActiveRecord::Base
  before_create :generate_token
  #validates :token,   presence: true
  validates :valid_seconds, presence: true
  validates :user_id,                       uniqueness: true

  belongs_to  :user


  def check_token?
    # If token is still valid, reload it and return True
    # Else return False
    if self.token_valid?
      self.reload_token!
      return true
    end
    self.delete
    return false
  end

  def token_valid?
    return self.token_expiration_delta() >= 0
  end

  def token_expiration_delta
    return (self.updated_at + self.valid_seconds) - Time.now
  end

  def reload_token!
    self.updated_at = Time.now
    self.save()
  end

  def self.get_if_token_valid(token)
    return nil if token == nil

    tmp_usr = token.split('-')[0]
    return find_by(:user_id=>tmp_usr, :token=>token)
  end

  private
    def generate_token
      # generates a 32-characters token that includes a static part (user id)
      # to prevent timing attacks
      begin
        tmp_token = self.user.id.to_s + '-' + SecureRandom.hex  # Avoid timing attacks by appending a static user attr
        self.token = tmp_token.first(32)
      end while self.class.exists?(token: token)
    end

end
