json.extract! address, :id, :zipcode, :neighborhood, :city, :state, :created_at, :updated_at
json.url address_url(address, format: :json)
