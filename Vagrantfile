# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
  config.vm.box = "ubuntu/trusty64"    
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000    
  config.vm.network "public_network"  
  config.vm.synced_folder "../../Code/Rails", "/Rails"
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
  end
 
  config.vm.provision :shell, path: "supporting/bootstrap.sh"  
end
