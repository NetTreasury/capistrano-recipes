require 'capistrano'
require 'capistrano/cli'

Dir.glob(File.join(File.dirname(__FILE__), '/capistrano/utils/*.rb')).sort.each { |f| load f }