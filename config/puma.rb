workers Integer(ENV["PUMA_WORKERS"] || 2)
threads Integer(ENV["PUMA_MIN_THREADS"]  || 1), Integer(ENV["PUMA_MAX_THREADS"] || 16)

preload_app!

#rackup      DefaultRackup
port        ENV["PORT"]     || 3000
environment ENV["RACK_ENV"] || "development"

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

