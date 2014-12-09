ENV['rails'] ||= '4.2.0.rc2'

source 'https://rubygems.org'

gem 'rails', "~> #{ENV['rails']}"

if ENV['rails'][0] == '4'
  gem 'database_cleaner'
end

gemspec path: '../'
