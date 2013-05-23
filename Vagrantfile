Vagrant.configure("2") do |config|
    config.vm.box = "precise32"    
    config.vm.box_url = "../precise32.box"
    
    config.ssh.forward_x11 = :true

    config.vm.network :forwarded_port, guest: 8080, host: 8080
    config.vm.provision :shell, :path => "shell/main.sh"
    config.vm.provision :puppet

end
