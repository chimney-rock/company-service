source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'pg'
gem 'rails', '~> 6.0.0.rc1'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'oj', '~> 3.7'
gem 'goldiloader', '~> 3.1'

# API
gem 'rack-cors'
gem 'rack-attack'
gem 'graphql', '~> 1.9'
gem 'google-protobuf', '~> 3.7', '>= 3.7.1'

group :development do
  gem 'debase', '~> 0.2.2'
  gem 'ruby-debug-ide', '0.7.0.beta4'
  gem 'annotate', '~> 2.7'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'faker', github: 'stympy/faker'
  gem 'awesome_print', '~> 1.8'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'dotenv-rails'
  gem 'rspec-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
