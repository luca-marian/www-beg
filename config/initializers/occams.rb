# frozen_string_literal: true

Occams.configure do |config|
  config.cms_title = 'CMS Engine administration'
  config.admin_base_controller = 'ApplicationController'
  config.public_base_controller = 'ApplicationController'
  config.admin_auth = 'AdminAuthentication'
  config.admin_authorization = 'AdminAuthorization'
  config.public_auth = 'Config::Auth::PublicAuthentication'
  config.public_authorization = 'Config::Auth::PublicAuthorization'
  config.admin_route_redirect = ''
  config.enable_seeds = false
  config.seeds_path = File.expand_path('db/cms_seeds', Rails.root)
  config.revisions_limit = 1
  config.admin_cache_sweeper = nil
  config.allow_erb = true
  config.allowed_helpers = nil
  config.allowed_partials = nil
  config.hostname_aliases = nil
  config.reveal_cms_partials = false
end

# Default credentials for Occams::AccessControl::AdminAuthentication
# YOU REALLY WANT TO CHANGE THIS BEFORE PUTTING YOUR SITE LIVE
Occams::AccessControl::AdminAuthentication.username = 'user'
Occams::AccessControl::AdminAuthentication.password = 'pass'
