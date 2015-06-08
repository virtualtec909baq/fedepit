Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true
  config.log_level = :debug
  config.serve_static_files  = true
  config.assets.compile = true
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.perform_deliveries = true
  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { :host => 'http://fedepit.herokuapp.com/' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                  587,
      domain:               'gmail.com',
      user_name:            "desarrollo@solutek.com.co",
      password:             "solutek12345",
      authentication:       'plain',
      openssl_verify_mode:  'none',
  }
end
