#"type_enum", "user_id", "name", "country", "city", 
#"street", "zipcode", "number", "created_at", "updated_at"

class Company < ActiveRecord::Base
  validates :type_enum,   presence: true
  validates :name,        presence: true,   uniqueness: true
  validates :country,     presence: true
  validates :city,        presence: true
  validates :user_id,                       uniqueness: true
  
  belongs_to  :user
  has_many    :company_product
end
