source 'https://rubygems.org'

gem 'rails', '~> 5.0.1'

# Core
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'

# Authentication
gem 'devise', '~> 4.2'
gem 'devise-bootstrap-views', github: 'hisea/devise-bootstrap-views', branch: 'bootstrap4'

# Assets
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'bootstrap', '~> 4.0.0.alpha6'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  # Better error pages
  gem 'better_errors'
  gem 'binding_of_caller'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Control code quality
  gem 'rubocop'
end
