
require 'active_record'

env = ENV.fetch('ENVIRONMENT', 'dev')

db_config_file = File.open(File.expand_path('../database.yml', __dir__))
db_config = YAML.safe_load(db_config_file)[env]

db_config.merge!('url' => ENV.fetch('RPS_DATABASE_URL', nil)) if env == 'prod'

ActiveRecord::Base.establish_connection(db_config)
