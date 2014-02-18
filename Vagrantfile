VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: "10.0.1.14"
  config.vm.box = "precise64"
  config.vm.synced_folder ".", "/vagrant", nfs: true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.verbose = "vv"
  end

  # hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.hostname = "colibrary"

  # for vagrant-exec plugin
  config.exec.root = "/vagrant"
  config.exec.prepend_with "bundle exec", only: %w(spring rails rake unicorn)
  config.exec.prepend_with "USER=Kirillov bundle exec", only: %w(cap)
end
