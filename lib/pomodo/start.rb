module Pomodo
  class Start
    attr_reader :work, :rest

    def initialize(work, rest)
      @work = work.to_i * 60
      @rest = rest.to_i * 60
    end

    def run
      luxafor_id = File.open(Pomodo::CONFIG_PATH).read.strip
      flag = Luxafor::Client.new(luxafor_id)

      while true do
        flag.on("FF0000")
        sleep(work)

        flag.on("00FF00")
        Kernel.system("osascript -e 'display notification \"Yay, coffee time!\" with title \"Pomodo\"'")
        sleep(rest)
      end
    end
  end
end
