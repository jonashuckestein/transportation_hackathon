# Use from console to debug/senity-check resque behavior when you
# think it's not working: Resque.enqueue TestJob, 'some_behavior'
#
class TestJob
  include Sidekiq::Worker

  def perform(behavior='crash', *args)
    p "Performing test job with behavior #{behavior} and args:"
    p args.inspect
    case behavior
      when 'crash'
        raise 'Intentional resque crash for testing'
      when 'sleep'
        time = args[0].to_i || 10
        p "Sleeping #{time} seconds"
        while time > 0
          p(time)
          sleep(1)
          time -= 1
        end
      #when 'wrapper'
        #Airbrake.wrapper do
          #raise "Intentional airbrake wrapped resque crash for testing"
        #end
    end
  end
end
