require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/unicorn'
# require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

# Production Deployment:
set :domain, '104.236.132.77'

# Staging Deployment:
#set :domain, '192.168.0.103'

set :deploy_to, '/home/deployer/swsdi-manager'
set :repository, 'https://github.com/raglover/swsdi-manager.git'
set :branch, 'master'
set :user, 'deployer'
set :forward_agent, true
set :port, '22'
set :term_mode, nil

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_files, ['config/database.yml', 'config/secrets.yml']
set :shared_dirs, ['log', 'tmp/sockets', 'tmp/pids', 'public/assets', 'vendor/bundle', 'public/uploads', 'public/documents']

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  command %{
    echo "----> Loading environment"
    #{echo_cmd %[source ~/.bashrc]}
  }
  invoke :'rbenv:load'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  command %[mkdir -p "#{deploy_to}/shared/log"]
  command %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  command %[mkdir -p "#{deploy_to}/shared/config"]
  command %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  command %[touch "#{deploy_to}/shared/config/database.yml"]
  command %[echo "-----> Be sure to edit '#{deploy_to}/shared/config/database.yml'."]

  command %[touch "#{deploy_to}/shared/config/secrets.yml"]
  command %[echo "-----> Be sure to edit '#{deploy_to}/shared/config/secrets.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'unicorn:restart'
    end
  end
end

desc "Restarts Unicorn"
task :urestart => :environment do
    invoke :'unicorn:restart'
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

