# frozen_string_literal: true

source 'https://rubygems.org'

gem 'haml'
gem 'hanami', '~> 1.1'
gem 'hanami-model', '~> 1.1'
gem 'rake'
gem 'sass'

gem 'pg'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
end

group :test, :development do
  gem 'byebug'
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'capybara'
  gem 'rspec'
end

group :production do
  # gem 'puma'
end
ruby '2.4.2'
