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
  config.vm.box_download_insecure=true
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  #configure provisioners on tha machine
  config.vm.provision :docker
  config.vm.provision :docker_compose
  #config.vm.provision :shell, path: "bootstrap.sh" 
  #config.vm.provision :file, source: "file.txt", destination: "file.txt"
  #config.vm.provision :file, source: "HTML", destination: "HTMLDIR"
  config.vm.define "ci-server" do |ciserver|
    ciserver.vm.network "private_network", ip: '192.168.56.70'
    ciserver.vm.hostname = "ci-server"
    #ciserver.vm.provision :shell, inline: "echo Hi team, from inline"
    #ciserver.vm.provision :shell, inline: $script
    #ciserver.vm.provision :shell do |x|
    #  x.inline = "echo $1"
    #  x.args = ["AT", "Class!"]
    #end
    #dockerserver.vm.provision "docker" do |d|
    #  d.run "hello-world"
    #end
  end

  config.vm.define "server-2" do |server2|
    server2.vm.network "private_network", ip: '192.168.56.71'
    server2.vm.hostname = "server-2"
    server2.vm.provision :file, source: "converter", destination: "converter"
    server2.vm.provision "shell", inline: "docker compose -f /home/vagrant/converter/docker-compose.yaml up -d"
  end
end