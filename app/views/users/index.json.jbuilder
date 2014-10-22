json.array!(@users) do |user|
  json.extract! user, :id, :name, :last_name, :email, :password, :login, :date_of_birth
  json.url user_url(user, format: :json)
end
