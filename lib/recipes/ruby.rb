namespace :ruby do
  desc "Install Ruby, and the Bundler gem"
  task :install, roles: :app do
    run "#{sudo} add-apt-repository -y ppa:brightbox/ruby-ng"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install ruby1.9.3"

    run "#{sudo} gem install bundler --no-ri --no-rdoc"
  end
  after "deploy:install", "ruby:install"
end



