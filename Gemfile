# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.4', '>= 6.0.4.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'

gem 'jbuilder', '~> 2.7'
gem 'olive_branch'
gem 'rubocop-rails', require: false
gem 'bootsnap', '>= 1.4.2', require: false
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'devise', '~> 4.2'
gem 'devise-jwt'
gem 'annotate'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'parallel_tests'
  gem 'dotenv-rails'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'dotenv-rails'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
