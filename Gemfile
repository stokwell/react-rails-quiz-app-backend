source 'https://rubygems.org'

gem 'rails', '~> 5.0.2'

gem 'active_model_serializers'

gem 'responders'

gem 'spring', :group => :development

gem 'listen', :group => :development

gem 'pg'

gem 'rack-cors', :require => 'rack/cors'

gem 'dotenv'

gem 'dotenv-deployment', require: 'dotenv/deployment'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do 
  gem 'shoulda-matchers', require: false
end

group :development do 
  gem 'capistrano', require: false
  gem 'capistrano-bundle', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
