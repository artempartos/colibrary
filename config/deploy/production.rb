set :stage, :production
set :rails_env, 'production'
set :branch, 'master'

server '62.76.184.163', user: 'library_production', roles: %w{web app}