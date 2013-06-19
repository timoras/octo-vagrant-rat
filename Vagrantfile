Vagrant.configure("2") do |config|
    config.vm.box = "cen"  
    config.vm.box_url = "../centos32.box"
#    config.vm.box_url = "https://dl.dropboxusercontent.com/u/255729/CentOS-6.4-i386-v20130427.box"
    config.ssh.forward_x11 = :true

    config.vm.network :forwarded_port, guest: 5432, host: 5432
    config.vm.provision :shell, :path => "shell/main.sh"
    config.vm.provision :puppet
    config.vm.provider "virtualbox" do |v|
        v.gui = true
    end
end
