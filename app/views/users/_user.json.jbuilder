json.extract! user, :id, :first_name, :last_name, :state, :city, :neighborhood,
              :email, :password, :level, :gender, :age, :profile_picture, :coach, :cost_per_hour, :created_at, :updated_at
json.url user_url(user, format: :json)
