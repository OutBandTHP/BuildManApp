# Puma can serve each request in a thread from an internal thread pool.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `worker_timeout` threshold that Puma will use to wait before
# terminating a worker in development environments.
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port        ENV.fetch("PORT")            { 3000 }
environment ENV.fetch("RAILS_ENV")       { ENV['RACK_ENV'] || "development" }
pidfile     ENV.fetch("PIDFILE")         { "tmp/pids/server.pid" }
# workers     ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!
plugin :tmp_restart
