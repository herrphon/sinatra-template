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


# some other ideo here:
# https://gist.github.com/kalmbach/4471560

namespace :db do
  require "sequel"
  Sequel.extension :migration
  DB = Sequel.connect(ENV["DATABASE_URL"])


  desc "Prints current schema version"
  task :version do
    version = if DB.tables.include?(:schema_info)
                DB[:schema_info].first[:version]
              end || 0

    puts "Schema Version: #{version}"
  end


  desc "Perform migration up to latest migration available"
  task :migrate do
    Sequel::Migrator.run(DB, "migrations")
    Rake::Task['db:version'].execute
  end


  desc "Perform rollback to specified target or full rollback as default"
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, "migrations", :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end


  desc "Perform migration reset (full rollback and migration)"
  task :reset do
    Sequel::Migrator.run(DB, "migrations", :target => 0)
    Sequel::Migrator.run(DB, "migrations")
    Rake::Task['db:version'].execute
  end

end