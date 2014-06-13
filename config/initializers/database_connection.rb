Rails.application.config.after_initialize do
  ActiveRecord::Base.connection_pool.disconnect!

  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env]
    config["reaping_frequency"] = ENV["DB_REAP_FREQ"] || 10 # seconds
    config["pool"]              = ENV["DB_POOL"]      || ENV["PUMA_MAX_THREADS"] || 5
    ActiveRecord::Base.establish_connection(config)
  end
end

# http://blog.codeship.io/2013/10/16/unleash-the-puma-on-heroku.html
#config/initializers/database_connection.rb
#Rails.application.config.after_initialize do

  #ActiveRecord::Base.connection_pool.disconnect!

  #ActiveSupport.on_load(:active_record) do
    #if Rails.application.config.database_configuration
      #puts Rails.env
      #config = Rails.application.config.database_configuration[Rails.env]
      #puts Rails.application.config.database_configuration.inspect
      #puts config.inspect
      #puts caller
      #if config .present?
        #config["reaping_frequency"] = ENV["DB_REAP_FREQ"] || 10 # seconds
        #config["pool"]              = ENV["DB_POOL"]      || 5
        #ActiveRecord::Base.establish_connection(config)
      #end
    #end
  #end
#end
