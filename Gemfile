source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"

gem "bootsnap", require: false
gem "puma"
gem 'mysql2'
gem 'ridgepole'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug"
  gem 'rspec-rails'
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'web-console'
end

