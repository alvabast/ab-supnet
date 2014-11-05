# user_id, token, valid_seconds, updated_at
class Session < ActiveRecord::Base
  before_create :generate_token
  #validates :token,   presence: true
  validates :user_id,                   uniqueness: true

  belongs_to  :user

  private
    def generate_token
      puts 'aaaaaaf'
      self.token = SecureRandom.hex
    end

end
