module Pomodo
  class Stop
    def initialize
      if configuration.pid == nil
        puts "No pomodo process attached."
        exit 1
      end
    end

    def run
      system("kill -9 #{configuration.pid}")
      configuration.pid = nil
      exit 0
    end

    private

    def configuration
      @configuration ||= Pomodo::Configuration.new
    end
  end
end
