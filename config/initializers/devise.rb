# frozen_string_literal: true

Devise.setup do |config|
  # config.secret_key = '212a90a2843e23528cb757e77971f166a154f1ffbbeaaeb03c1f23a901c12e070b872692a5dc8abf798b7d38797cc2ec52b3df40d3fe9633948f4f6ed568f350'
  # config.parent_controller = 'DeviseController'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  # config.mailer = 'Devise::Mailer'
  # config.parent_mailer = 'ActionMailer::Base'

  require 'devise/orm/active_record'

  # config.authentication_keys = [:email]
  # config.request_keys = []
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  # config.params_authenticatable = true
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true
  config.skip_session_storage = [:http_auth]
  # config.clean_up_csrf_token_on_authentication = true
  # config.reload_routes = true
  config.stretches = Rails.env.test? ? 1 : 11
  # config.pepper = 'b792eaa82c59a89ba1d34ea453248fd819efae9172a0ac27e3c2fe5d622a6b33bb55d0afbf7622f8a9e58abc3e3615ec3ca770b00518a80af8d4b4238e85c0aa'
  # config.send_email_changed_notification = false
  # config.send_password_change_notification = false
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days
  config.reconfirmable = true
  # config.confirmation_keys = [:email]
  # config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  # config.extend_remember_period = false
  # config.rememberable_options = {}
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  # config.timeout_in = 30.minutes
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [:email]

  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.

  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.last_attempt_warning = true
  # config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours
  # config.sign_in_after_reset_password = true
  # config.encryptor = :sha512
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true
  config.sign_out_via = :delete
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  config.omniauth :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
  config.omniauth :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  OmniAuth.config.logger = Rails.logger if Rails.env.development?

  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # config.router_name = :my_engine
  # config.omniauth_path_prefix = '/my_engine/users/auth'

  # ActiveSupport.on_load(:devise_failure_app) do
  #   include Turbolinks::Controller
  # end
end