source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'devise'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'httparty'
gem "haml"
gem 'compass-rails', '~> 2.0.0'
gem "octokit", "~> 4.0"
gem "active_model_serializers"
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "figaro"
  gem 'byebug'
  gem 'rspec-rails'
  gem 'awesome_print'
  gem "pry"
end

group :test do
  gem 'codeclimate-test-reporter', git: 'https://github.com/codeclimate/ruby-test-reporter.git', branch: 'master', require: nil
  gem 'shoulda-matchers', '~> 2.0'
  gem 'capybara'
  gem 'vcr', '~> 3.0', '>= 3.0.3'
  gem 'webmock', '~> 2.1'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-collection_matchers'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'better_errors'
end
