set :application, 'colibrary'
set :repo_url, 'git@github.com:artempartos/colibrary.git'

set :deploy_to, '/u/apps/library'
set :scm, :git

set :format, :pretty
set :log_level, :debug

set :use_sudo, false

#raise fetch(:bundle_bins).inspect
#set :bundle_bins, fetch(:bundle_bins, []) - ['rake']


#set :rvm_path, RVM_SYSTEM_PATH
set :rvm_ruby_version, 'ruby-1.9.3-p327'

set :pty, true

# https://help.github.com/articles/using-ssh-agent-forwarding
# use "ssh-add ~/.ssh/id_rsa"
set :ssh_options, :forward_agent => true

set :keep_releases, 5

#set :shared_files, %w()
set :linked_files, %w(config/database.yml config/backup.rb)
set :linked_dirs, %w{public/system log public/assets bin}

set :bundle_binstubs, -> { shared_path.join('bin') }

set :bundle_bins, fetch(:bundle_bins, []) + shared_path.join('bin')

namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:stop'
  end

  after :finishing, 'deploy:cleanup'
end

namespace :unicorn do
  pid_path = "#{shared_path}/pids"
  unicorn_pid = "#{pid_path}/unicorn.pid"

  desc 'Stop unicorn'
  task :stop do
    on roles(:app) do
      execute :kill, "-QUIT `cat #{unicorn_pid}`" if test "[ -f #{unicorn_pid} ]"
    end
  end

end