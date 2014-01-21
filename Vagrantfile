Vagrant.configure("2") do |config|
    
	config.vm.box = "ceeeee"      
	config.vm.box_url = "../CentOS-6.4-i386-v20130427.box"	
	#config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130427.box"
	#config.vm.box_url =  "https://dl.dropbox.com/sh/9rldlpj3cmdtntc/56JW-DSK35/centos-62-32bit-puppet.box" 
	#config.vm.box_url = "https://dl.dropboxusercontent.com/u/255729/CentOS-6.4-i386-v20130427.box"
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
