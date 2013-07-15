# This is a sample deployment script used for the Rails Blog
# application with Rails 4.0 and Ruby 2.0.0.

require "rvm/capistrano"
set :rvm_ruby_string, 'default'
require "bundler/capistrano"

# Set application and username
set :application, "rails-blog"
set :user, "username"

# set :port, 2200 # Set SSH port if necessary
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :copy
set :use_sudo, false

# Point to application's git repository location
set :scm, :git
set :repository, "./.git"
set :branch, "master"

# Server information, update with your server's IP Address
role :web, "123.456.7.890"
role :app, "123.456.7.890"
role :db,  "123.456.7.890", :primary => true
role :db,  "123.456.7.890"

# Passenger

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:precompile_assets"
after "deploy:precompile_assets", "deploy:restart"

namespace :deploy do
  task :bundle_gems do
    run "cd #{deploy_to}/current && bundle install"
  end

  task :precompile_assets do
    run "cd #{deploy_to}/current && RAILS_ENV=production rake assets:precompile --trace"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end