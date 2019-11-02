require "json"

module Pomodo
  CONFIG_DIR = [ENV["HOME"], ".pomodo"].join("/").freeze
  CONFIG_PATH = [CONFIG_DIR, "config"].join("/").freeze

  class Configuration
    DEFAULT = {
      "schema" => 1,
      "luxafor_id" => nil,
      "notifications" => {
        "work" => false,
        "rest" => true
      },
      "pid" => nil
    }.freeze

    def luxafor_id
      read["luxafor_id"]
    end

    def pid
      read["pid"]
    end

    def notifications
      read["notifications"]
    end

    def luxafor_id=(luxafor_id)
      configuration = read
      configuration["luxafor_id"] = luxafor_id
      write(configuration)
    end

    def pid=(pid)
      configuration = read
      configuration["pid"] = pid
      write(configuration)
    end

    private

    def read
      content = File.open(Pomodo::CONFIG_PATH).read
      config = JSON.parse(content)
      Configuration::DEFAULT.merge(config)
    rescue Errno::ENOENT
      Configuration::DEFAULT.dup
    end

    def write(configuration)
      system("mkdir -p #{Pomodo::CONFIG_DIR}")

      File.open(Pomodo::CONFIG_PATH, 'w') do |file|
        file.write(configuration.to_json)
      end
    end
  end
end
