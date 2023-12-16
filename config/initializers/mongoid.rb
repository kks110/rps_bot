require 'mongoid'

Mongoid.configure do |config|
  config.clients.default = {
    hosts: ['localhost:27017'],
    database: ENV.fetch('RPS_DATABASE', 'rps_bot'),
    options: {
      user: ENV.fetch('RPS_DB_USER', 'user'),
      password: ENV.fetch('RPS_DB_PASSWORD', 'password')
    }
  }
  config.log_level = :warn
end
Mongoid.raise_not_found_error = false
