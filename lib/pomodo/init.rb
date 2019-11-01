module Pomodo
  class Init
    def initialize(luxafor_id)
      @luxafor_id = luxafor_id

      unless @luxafor_id.match(/^[a-z0-9]{12}$/)
        puts "Looks like an invalid Luxafor ID. Open the Luxafor app,\n" \
             "and copy the webhook id under General > Webhook."
        exit 1
      end
    end

    def run
      Kernel.system("mkdir -p #{Pomodo::CONFIG_DIR}")
      Kernel.system("echo \"#{@luxafor_id}\" > #{Pomodo::CONFIG_PATH}")
    end
  end
end
