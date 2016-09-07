# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :db do
  desc 'Rebuild DB from scratch'
  task rebuild: %w(db:drop db:create db:load db:migrate) do
    puts 'DB rebuilt successfully'
  end

  desc 'Load dump into DB'
  task :load do
    `pgloader db/soccer.load`
    puts 'Loaded dump into DB'
  end
end
