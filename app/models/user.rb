#"name", "last_name", "email", "password", "login"
#"date_of_birth", "created_at", "updated_at"
    
class User < ActiveRecord::Base
  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  

  has_one    :company
end
