require 'redis'
class ManualCacheService
  def initialize(event, key, value = nil)
    @event = event
    @key = key
    @value = value
  end

  def deliver
    return if ENV['TURN_OFF_MANUAL_CACHE']
    return unless @event
    send @event
  end

  private

  def set
    redis_storage_setting.set @key, @value
  end

  def get
    redis_storage_setting.get @key
  end

  def redis_storage_setting
    $redis_storage_setting ||= init_redis_storage_setting
  end

  def init_redis_storage_setting
    redis_config_file = 'config/redis.yml'
    redis_config = YAML.safe_load(ERB.new(File.new(redis_config_file).read).result)
    Redis.new(redis_config['redis'].deep_symbolize_keys.compact)
  end
end
