json.extract! user, :id, :name, :que_id, :wait_number, :created_at, :updated_at
json.url user_url(user, format: :json)
