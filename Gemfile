source "https://rubygems.org"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.3'
gem 'rails'

#DB
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'

#画像アップロード
gem 'carrierwave'
# gem 'fog'
gem 'mini_magick'

#環境変数
gem 'dotenv-rails'

#フロントエンド系
# gem 'bootstrap'
gem 'coffee-rails', '~> 4.2'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem "font-awesome-rails"
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'bootsnap', '>= 1.1.0'

#認証系
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'

gem 'faker'

group :development, :test do
  #デバッグ系
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'

  #テスト
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '~> 2.0'

  #メールテスト
  gem 'letter_opener_web'
end

group :test do
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]