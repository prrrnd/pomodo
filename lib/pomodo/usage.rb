module Pomodo
  class Usage
    def to_s
      "pomodo #{Pomodo::VERSION}\nUsage:\n" \
      "  pomodo init LUXAFOR_ID\n" \
      "  pomodo start [work] [rest]\n" \
      "   [work]: in minutes, default is '25'\n" \
      "   [rest]: in minutes, default is '5'\n" \
      "\n" \
      "Configuration is saved to: #{Pomodo::CONFIG_PATH}\n"
    end
  end
end
