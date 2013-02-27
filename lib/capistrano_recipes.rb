require 'capistrano'
require 'capistrano/cli'

Capistrano::Configuration.instance.load do
  namespace :foo do
    desc "Testing the gem"
    task :bar do
      run "#{sudo} echo 'this is a test'"
    end
  end
end if Capistrano::Configuration.instance

#Dir.glob(File.join(File.dirname(__FILE__), '/recipes/*.rb')).sort.each { |f| load f }