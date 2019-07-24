source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.3"

gem "rails", "~> 5.2.2"

gem "pg", ">= 0.18", "< 2.0"

gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false

gem "rollbar"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3", "~> 1.3.6"
end

group :development do
  # Performance
  gem 'bullet', '~> 5.9'
  gem 'rack-mini-profiler', '~> 1.0'

  # Errors
  gem 'better_errors', '~> 2.5'
  gem 'web-console', '~> 3.7'

  gem 'binding_of_caller', '~> 0.8'
  gem 'listen', '~> 3.1'
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0'

  # Linters
  gem 'annotate', '~> 2.7'
  gem 'ordinare', '~> 0.4'
  gem 'rubocop-rails_config', '~> 0.5'

  # Gemfile health
  gem 'pessimize', '~> 0.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "responders"
gem "activestorage-validator"

# Utils
gem 'discard', '~> 1.1'
gem 'pagy', '~> 3.3'
gem "simple_form"
gem "aws-sdk"
gem "bcrypt"

# Levenshtein Distance Analyzer
gem 'edits'