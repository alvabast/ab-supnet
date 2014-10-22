json.array!(@companies) do |company|
  json.extract! company, :id, :type_enum, :user_id, :name, :country, :city, :street, :zipcode, :number
  json.url company_url(company, format: :json)
end
