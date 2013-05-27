Vagrant.configure("2") do |config|
    config.vm.box = "cen"  
    config.vm.box_url = "../centos64.box"
#    config.vm.box_url = "https://dl.dropbox.com/u/7196/vagrant/CentOS-56-x64-packages-puppet-2.6.10-chef-0.10.6.box"
    config.ssh.forward_x11 = :true

    config.vm.network :forwarded_port, guest: 5432, host: 5432
    config.vm.provision :shell, :path => "shell/main.sh"
    config.vm.provision :puppet

end
