source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"
gem "rails-i18n"
gem "sidekiq"
gem "puma", "~> 5.0"
gem "devise" # Authentication 
gem "devise-i18n-views"
gem "cancancan" # Authorization
gem "stripe" # Payments
gem 'money-rails', '~>1.12' # Money

# assets & frontend part without sprockets
gem "cssbundling-rails", "~> 1.1"
gem "jsbundling-rails", "~> 1.1"

gem "turbo-rails"
gem "stimulus-rails"

gem "pg", "~> 1.1" # Database for Active Record
gem "redis", "~> 4.0" # Redis adapter
gem 'redis-rails'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

gem "health_bit" # Healthcheck for applications

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  gem "rails-erd"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "factory_bot_rails", "~> 6.2", require: false
gem "faker", "~> 3.2", require: false

gem "rails_admin", "~> 3.1"
gem "sassc-rails"
