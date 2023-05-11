$script = <<-SCRIPT
echo "I like Vagrant"
echo "I love Linux"
touch file3
SCRIPT
#date > ~/vagrant_provisioned_at
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  #configure provisioners on tha machine
  config.vm.provision :docker
  config.vm.provision :shell, path: "bootstrap.sh" 
  config.vm.provision :file, source: "file.txt", destination: "file.txt"
  config.vm.provision :file, source: "HTML", destination: "HTMLDIR"
  config.vm.define "server-1" do |dockerserver|
    dockerserver.vm.network "private_network", ip: '192.168.56.60'
    dockerserver.vm.hostname = "dockerserver"
    dockerserver.vm.provision :shell, inline: "echo Hi team, from inline"
    dockerserver.vm.provision :shell, inline: $script
    dockerserver.vm.provision :shell do |x|
      x.inline = "echo $1"
      x.args = ["AT", "Class!"]
    end
    dockerserver.vm.provision "docker" do |d|
      d.run "hello-world"
    end
  end
end