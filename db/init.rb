require 'sequel'
require 'logger'


DB = Sequel.connect 'sqlite://db/production.sqlite'


Sequel.extension :migration
db_migration_path = File.join __dir__, 'migrations'

unless Sequel::Migrator.is_current? DB, db_migration_path
  puts "DB not in current version"
  puts "Upgrading to latest version of migrations:"

  logger = Logger.new(STDOUT)
  DB.loggers << logger
  Sequel::Migrator.run(DB, db_migration_path)
  DB.loggers = []
end


puts "DB successfully initialized and checked to be in latest migration state."