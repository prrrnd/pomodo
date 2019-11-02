module Pomodo
  class Init
    attr_reader :luxafor_id

    def initialize(luxafor_id)
      @luxafor_id = luxafor_id

      validate_luxafor_id!
    end

    def run
      config = Pomodo::Configuration.new
      config.luxafor_id = luxafor_id

      exit 0
    end

    private

    def validate_luxafor_id!
      return if luxafor_id.match(/^[a-z0-9]{12}$/)

      puts "Looks like an invalid Luxafor ID. Open the Luxafor app,\n" \
            "and copy the webhook id under General > Webhook."
      exit 1
    end
  end
end
