
require 'active_record'
require 'yaml'
require 'pry'
require_relative './config/initializers/postgres'

namespace :db do
  desc 'Run database migrations'
  task :migrate do
    ActiveRecord::MigrationContext.new('./migrations', ActiveRecord::SchemaMigration).migrate
  end
end
