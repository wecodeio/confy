desc "Raise an error unless development environment"
task :safety_check do
  raise "You can only use this in dev!" unless Rails.env.development?
end

task kill_postgres_connections: :environment do
  db_name = "confy_development"
  %(psql -c "SELECT pg_terminate_backend(procpid) FROM pg_stat_activity WHERE procpid <> pg_backend_pid();" -d '#{db_name}')
end

namespace :db do
  desc "Drop, create, migrate then seed the development database"
  task reseed: [
    "environment",
    "safety_check",
    "kill_postgres_connections",
    "db:reset",
    "db:seed"
  ]
end
