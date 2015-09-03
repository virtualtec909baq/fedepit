set :application, 'fedepit'
set :deploy_user, 'root'

# setup repo details
set :scm, :git
set :repo_url, 'https://github.com/virtualtec909baq/fedepit.git'

# setup rvm.
set :rbenv_type, :system
set :rbenv_custom_path, '/root/.rbenv/'
set :rbenv_ruby, '2.2.2'
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :bundle_path,     nil
set :bundle_binstubs, nil
set :bundle_flags,    '--system'
set :assets_roles, [:app]


# how many old releases do we want to keep
set :keep_releases, 5

# files we want symlinking to specific entries in shared.
set :linked_files, %w{config/database.yml}

# dirs we want symlinking to shared
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
set :tests, []

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(
  log_rotation
  monit
  unicorn.rb
))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
set(:symlinks, [
  {
    source: "log_rotation",
   link: "/etc/logrotate.d/#{fetch(:full_app_name)}"
  },
  {
    source: "monit",
    link: "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
  }
])


# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

# before 'deploy', 'rvm1:install:gems'

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run("cd #{deploy_to}/current; /usr/bin/env bundle exec rake db:seed")
  end
end