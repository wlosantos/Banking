source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'jbuilder', '~> 2.7'

gem 'haml'
gem 'haml-rails'

gem 'devise'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'better_errors','>= 2.7.1'
  gem 'sqlite3', '~> 1.4'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker'
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  gem 'awesome_print'
end

group :test do
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :production do
  gem 'pg', '~> 1.1'
end
