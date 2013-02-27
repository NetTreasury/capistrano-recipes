namespace :git do
  desc "Install latest stable release of git-core"
  task :install, roles: :web do
    run "#{sudo} apt-get -y install git-core"
  end
  after "deploy:install", "git:install"

  desc "Setup nginx configuration for this application"
  task :setup, roles: :web do
    run "ssh git@github.com || true", :pty => true do |ch, stream, data|
    if data =~ /continue.connecting/
      #prompt, and then send the response to the remote process
      ch.send_data('yes' + "\n")
    else
      #use the default handler for all other text
      Capistrano::Configuration.default_io_proc.call(ch,stream,data)
    end
  end
  end
  before "deploy:cold", "git:setup"

end

