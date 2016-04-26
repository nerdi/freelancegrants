source 'https://rubygems.org'

ruby '2.2.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
#bootsrap requirements
gem 'bootstrap', '~> 4.0.0.alpha3'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
#activeadmin requirements
gem 'devise'
gem 'activeadmin', github: 'activeadmin'
#allows for markdown in activeadmin
gem 'redcarpet'
#allows for file uploads
gem "rmagick"
gem "carrierwave"
gem 'carrierwave-dropbox'

# Use refile for image uploads to aws
gem "refile", require: "refile/rails"
gem "refile-mini_magick"
gem "refile-s3"

#add Wysywig editor
gem 'redactor-rails'

# elasticsearch
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
# add saerchkick for additional search functionality with ease
gem 'searchkick'
gem 'redis'

#add slim templates for simplified erb and html
gem "slim-rails"

#add MailChimp Functionality
gem "gibbon"

# Run background tasks
gem "sidekiq"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem "better_errors"
gem 'puma'
gem 'stripe'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'figaro'
  gem "letter_opener"
  gem "guard"
  gem "terminal-notifier-guard"
  gem "terminal-notifier"
  gem "rspec-rails", "~> 3.1.0"
  gem "factory_girl_rails", "~> 4.4.1"

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem "faker", "~> 1.4.3"
  gem "capybara", "~> 2.4.3"
  gem "database_cleaner", "~> 1.3.0"
  gem "launchy", "~> 2.4.2"
  gem "selenium-webdriver", "~> 2.43.0"
end

group :production do
  gem 'rails_12factor'

end
