json.extract! user_info, :id, :first_name, :last_name, :phone, :email, :created_at, :updated_at
json.url user_info_url(user_info, format: :json)