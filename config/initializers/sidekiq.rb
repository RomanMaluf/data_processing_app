# frozen_string_literal: true

sidekiq_config = {
  url: "redis://#{ENV.fetch("REDIS_HOST", nil)}:#{ENV.fetch("REDIS_PORT", nil)}/0",
  password: ENV.fetch('REDIS_PASSWORD', nil)
}

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end
Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
