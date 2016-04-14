source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.5'
gem 'bootstrap-sass'

group  :development  do
  gem  'sqlite3'
end

group  :production  do
  gem  'pg' ,  '0.15.1'
  gem  'rails_12factor' ,  '0.0.2'
end

group  :test do
	gem 'selenium-webdriver'
	gem 'capybara'

  gem 'cucumber-rails', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end


gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # gem 'byebug'
  gem 'rspec-rails', '>=2.0.0.beta'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end


gem 'bcrypt-ruby', '3.1.2'
