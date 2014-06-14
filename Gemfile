source "https://rubygems.org"
ruby "2.1.1"

gem "dotenv-rails", groups: %w(development test)

group :rails do
  gem "rails", "~> 4.1.0"
  gem "coffee-rails"
  gem "jquery-rails"
  gem "turbolinks"
  gem "haml-rails"
  gem "bootstrap_form", github: "bootstrap-ruby/rails-bootstrap-forms"
end

group :web_server do
  gem "puma"
  gem "rack-timeout"
  #gem "puma_auto_tune"
end

group :database do
  gem "pg"
  gem "foreigner"
end

gem "uglifier"

group :jobs do
  gem "redis"
  gem "hiredis"
  gem "sidekiq", ">= 3.0.0"
  gem "sidetiq", github: "tobiassvn/sidetiq" # for 3.0.0 compatibility
  gem "redis-rails"
end

group :development do
  gem "foreman"
  gem "binding_of_caller"
  gem "better_errors"
  gem "quiet_assets"
  gem "letter_opener"
  gem "bullet"
end

group :console do
  gem "pry"
  gem "pry-rails"
  gem "awesome_print"
end

group :assets do
  gem "sass-rails", ">= 4.0.0"
  gem "bootstrap-sass", "~> 3.1.1.0"
  gem "execjs"
end

group :heroku do
  gem "rails_12factor"
end

group :analytics do
  gem "analytics-ruby", "~>1.0"
  gem "useragent"
end

group :development, :test do
  gem "spring"
end

gem "sinatra"
gem "jbuilder"
