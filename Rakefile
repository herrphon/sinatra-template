require 'rake/testtask'
require 'yard'
require "yard/sinatra"


task :default => [:'']

desc "Run all tests"
task :'' do
  test_task = Rake::TestTask.new("alltests") do |t|
    t.test_files = Dir.glob(File.join("test", "**", "*_test.rb"))
  end
  task("alltests").execute
end

namespace :test do
  desc "Run models tests"
  task :models do
    ruby "test/models/*_test.rb"
  end

  desc "Run routes tests"
  task :routes do
    ruby "test/routes/*_test.rb"
  end
  
  desc "Run acceptance tests"
  task :acceptance do
    ruby "test/acceptance/*_test.rb"
  end
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ['app.rb', '**/helpers/*.rb', '**/routes/*.rb', '**/models/*.rb']
  t.options = ['--plugin', 'yard-sinatra', '--protected', '--private']
end



namespace :db do

  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    require "sequel"

    Sequel.extension :migration
    db = Sequel.connect(ENV.fetch("DATABASE_URL"))

    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(db, "db/migrations")
    end
  end

  desc 'Zap the database my running all the down migrations'
  task :zap do
    cmd = "sequel -m db/migrations -M 0 sqlite://db.sqlite"
    puts cmd
    puts `#{cmd}`
  end

  desc 'Reset the database then run the migrations'
  task :reset => [:zap, :migrate]
end