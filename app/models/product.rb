class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to  :product_type
  has_many    :company_product
end
