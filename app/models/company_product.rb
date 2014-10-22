class CompanyProduct < ActiveRecord::Base
  validates :product_id, uniqueness: { scope: :company_id,
    message: "One kind of product permitted per company" }
      
  belongs_to :company
  belongs_to :product
end
