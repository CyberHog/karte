source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem 'rails', '~> 5.1.5'
gem 'sqlite3', groups: %w(test development), require: false
gem 'pg', '~> 1.0', groups: %w(production), require: false
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'rails_12factor', group: :production

# gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.1', '>= 5.1.1'
gem 'devise-i18n-views'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'carrierwave', '~> 1.2', '>= 1.2.2'
gem 'mini_magick', '~> 4.8'
gem 'cocoon', '~> 1.2', '>= 1.2.11'
gem "acts_as_follower", github: "tcocca/acts_as_follower"

gem 'materialize-sass'

# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # エラー画面をわかりやすく整形してくれる
  gem 'better_errors'
  # better_errorsの画面上にirb/pry(PERL)を表示する
  gem 'binding_of_caller'
  gem 'letter_opener_web'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]