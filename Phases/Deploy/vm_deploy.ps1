
$Hypervisor = "vmware_desktop"
$Image_Name = "afolsom/rokcy_guac_ansible"
$MemorySize = 2048
$Number_CPUS = 4


$Vagrantfile= @"
#Set Hypervisor
HYPERVISOR = $Hypervisor

#Set Image
LINUX_IMAGE_NAME = $Image_Name #Linux instances use this image
GUI_VM = true

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    config.vm.provider HYPERVISOR do |v|
        v.gui = GUI_VM
        v.memory = 4096
        v.cpus = 4
    end
    config.vm.define "control1" do |control1|
        control1.vm.provider "$Hypervisor" do |v|
        v.memory = $MemorySize
        v.cpus = $Number_CPUS
        end
        control1.vm.box = LINUX_IMAGE_NAME
        control1.vm.hostname = "control1"
    end        

end
"@

Out-File -FilePath Vagrantfile -InputObject $Vagrantfile