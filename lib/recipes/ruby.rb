Capistrano::Configuration.instance.load do
  namespace :ruby do
    desc "Install Ruby 1.9.3, and the Bundler gem"
    task :install_193, roles: :app do
      run "#{sudo} add-apt-repository -y ppa:brightbox/ruby-ng"
      run "#{sudo} apt-get -y update"
      run "#{sudo} apt-get -y install ruby1.9.3"

      run "#{sudo} gem install bundler --no-ri --no-rdoc"
    end
    after "deploy:install", "ruby:install"

    desc "Install Ruby 2.0, and the Bundler gem"
    task :install, roles: :app do
      run "#{sudo} add-apt-repository -y ppa:brightbox/ruby-ng-experimental"
      run "#{sudo} apt-get -y update"
      run "#{sudo} apt-get -y install ruby2.0"

      run "#{sudo} gem install bundler --no-ri --no-rdoc"
    end
    after "deploy:install", "ruby:install"
  end
end
