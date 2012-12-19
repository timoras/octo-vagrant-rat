Vagrant::Config.run do |config|
    config.vm.box = "lucid64"
    config.vm.box_url = "http://dl.dropbox.com/u/4031118/Vagrant/ubuntu-12.04.1-server-i686-virtual.box"
    config.vm.provision :puppet, :options => "--verbose --debug"
end
