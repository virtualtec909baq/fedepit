source 'https://rubygems.org'

ruby File.read(".ruby-version").strip
gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem "jquery-ui-rails"
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem "therubyracer"
gem "less-rails"
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'devise'
gem 'mini_magick'
gem 'carrierwave'
gem 'bootstrap-datepicker-rails'
gem "font-awesome-rails"
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous'
gem 'faker'
gem 'rails-i18n'
gem 'rails4-autocomplete'
gem 'prawn'
gem 'nested_form_fields'
gem 'sshkit', '~> 1.4.0'

group :development do
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-safe-deploy-to', '~> 1.1.1'
  # cap tasks to manage puma application server
  gem 'capistrano-puma', require: false
  gem 'capistrano-rails'
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rvm',   '~> 0.1', require: false
end

group :production do
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets' 
  gem 'rails_log_stdout', github: 'heroku/rails_log_stdout'
  gem 'rails_12factor'
end
