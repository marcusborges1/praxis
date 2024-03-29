source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'cancancan', '~> 2.0'
gem 'cocoon', '~> 1.2'
gem 'devise', '~> 4.3'
gem 'humanize'
gem 'pg', '~> 0.20.0'
gem 'wicked_pdf', '~> 1.1'
gem 'will_paginate', '~> 3.1.0'
gem 'wkhtmltopdf-binary', '~> 0.12.3.1'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'rails-jquery-autocomplete'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails', '~> 4.8'
  gem 'rspec-rails', '~> 3.6'
  gem 'sendgrid-ruby'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Code metric and analyzer
  gem 'rails_best_practices', '~> 1.18'
  gem 'rubocop', '~> 0.49.1', require: false
end

group :test do
  gem 'database_cleaner', '~> 1.6'
  gem 'faker', '~> 1.6'
  gem 'shoulda-matchers', '~> 3.1', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
