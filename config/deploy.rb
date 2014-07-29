require "rvm/capistrano"
require "bundler/capistrano"
require 'capistrano_colors'
load 'deploy/assets'

set :rvm_type, :system
set :application, "my_test_01"

set :repository, "ssh://git@github.com/de177/my_test_01.git"

set :deploy_to, "/var/www/my_test_01"

set :scm, :git
set :branch, "master"
set :user, "deploy"
set :use_sudo, false

set :rails_env, "production"
set :deploy_via, :copy
set :copy_dir, "/home/#{ user }/tmp"
set :remote_copy_dir, "/tmp"

set :keep_releases, 5
role :web, "95.131.89.90"
role :app, "95.131.89.90"
role :db, "95.131.89.90", :primary => true

namespace :deploy do

desc "Symlink shared config files"

task :symlink_config_files do
    run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
    end
end

after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"

#set :application, "set your application name here"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end