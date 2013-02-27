def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install build-essential make python-software-properties"

    #set the server locale
    run "#{sudo} apt-get -y install language-pack-en-base"
    set_default(:country_code) { Capistrano::CLI.password_prompt "Please specify the two letter country code, eg US/ZA/AU: " }
    template "locale.erb", "/tmp/locale"
    run "#{sudo} mv /tmp/locale /etc/default/locale"
  end
end
