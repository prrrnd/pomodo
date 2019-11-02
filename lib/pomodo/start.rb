module Pomodo
  class Start
    attr_reader :work_time, :rest_time, :flag

    def initialize(work_time, rest_time)
      @work_time = work_time.to_i * 60
      @rest_time = rest_time.to_i * 60
      @flag = Luxafor::Client.new(configuration.luxafor_id)

      if configuration.pid != nil
        puts "A pomodo process is already running (PID: #{configuration.pid})"
        puts "Use 'pomodo stop' to stop."
        exit 1
      end
    end

    def run
      Process.daemon(true, true)
      configuration.pid = Process.pid

      puts "Started new pomodo process with #{work_time / 60}/#{rest_time / 60}min split."
      puts "Use 'pomodo stop' to stop."

      while true do
        flag.on("FF0000")
        notify "Pomodoro for #{work_time / 60} minutes." if configuration.notifications["work"]
        sleep(work_time)

        flag.on("00FF00")
        notify "Break for #{rest_time / 60} minutes." if configuration.notifications["rest"]
        sleep(rest_time)
      end
    end

    private

    def configuration
      @configuration ||= Pomodo::Configuration.new
    end

    def notify(message)
      system("osascript -e 'display notification \"#{message}\" with title \"Pomodo\"'")
    end
  end
end
