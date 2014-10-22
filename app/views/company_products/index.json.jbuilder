json.array!(@company_products) do |company_product|
  json.extract! company_product, :id, :product_id, :company_id, :quantity, :quantity_unit, :price, :price_unit
  json.url company_product_url(company_product, format: :json)
end
