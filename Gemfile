# Defaults. For supported versions check .travis.yml
ENV['rails'] ||= ENV['orm'] == "mongoid4" ? '4.1.0' : '3.2.0'
ENV['orm']   ||= 'active_record'

source 'https://rubygems.org'

# Define Rails version
gem 'rails', "~> #{ENV['rails']}"

gem 'database_cleaner', '~> 1.0.0.RC1' if ENV['rails'][0] == '4'

case ENV['orm']
when 'active_record'
  gem 'activerecord'

when 'mongoid2'
  gem 'doorkeeper-orms', github: 'doorkeeper-gem/doorkeeper-orms'
  gem 'mongoid', '2.5.1'
  gem 'bson_ext', '~> 1.7'

when 'mongoid3'
  gem 'doorkeeper-orms', github: 'doorkeeper-gem/doorkeeper-orms'
  gem 'mongoid', '3.0.10'

when 'mongoid4'
  gem 'doorkeeper-orms', github: 'doorkeeper-gem/doorkeeper-orms'
  gem 'mongoid', '4.0.0.beta1'
  gem 'moped'

when 'mongo_mapper'
  gem 'doorkeeper-orms', github: 'doorkeeper-gem/doorkeeper-orms'
  gem 'mongo_mapper', '0.12.0'
  gem 'bson_ext', '~> 1.7'

end

gemspec
