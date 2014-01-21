Vagrant.configure("2") do |config|
    
    config.vm.box = "ubuntu"      
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"	
    config.ssh.forward_x11 = :true

    config.vm.network :forwarded_port, guest: 5432, host: 5432
    config.vm.provision :shell, :path => "shell/main.sh"
    config.vm.provision :puppet
    config.vm.provider "virtualbox" do |v|        
        v.name = "centos_postgress"
#        v.gui = true
        v.customize ["modifyvm", :id, "--memory", "1024"]
    end

end
