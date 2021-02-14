# Gemfile.lockを見てcapistranoのバージョンを入れる
lock '3.15.0'

# Capistranoのログの表示に利用する
set :application, 'tictac'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:nakanenakane/tictac.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'


set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/tictac.pem>'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end