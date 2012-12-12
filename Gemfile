source 'https://rubygems.org'

gem 'rails', '3.2.9'

gem 'pg'
gem 'jquery-rails'
gem "bootstrap-sass"
gem "devise"
gem "cancan"
gem "rolify"
gem "simple_form"
gem "stripe"
gem "stripe_event"

group :development do
	gem "quiet_assets"
	gem "better_errors"
	gem "binding_of_caller"
end

group :test do
	gem "database_cleaner"
	gem "email_spec"
	gem "launchy"
	gem "capybara"
	gem "cucumber-rails", :require => false
end

group :development, :test do
	gem "rspec-rails"
	gem "factory_girl_rails"
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
	gem "thin"
end