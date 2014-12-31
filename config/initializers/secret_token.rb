secret = Rails.env.production? ? ENV['SECRET_TOKEN'] : "top_secret_token"
puts "SECRET: #{secret}"
SimpleBarTab::Application.config.secret_key_base = secret
