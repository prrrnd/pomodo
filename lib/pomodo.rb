require "pomodo/version"
require "pomodo/usage"
require "pomodo/init"
require "pomodo/start"

require "luxafor"

module Pomodo
  CONFIG_DIR = [ENV["HOME"], ".pomodo"].join("/").freeze
  CONFIG_PATH = [CONFIG_DIR, "config"].join("/").freeze

  class Error < StandardError; end
  # Your code goes here...
end
