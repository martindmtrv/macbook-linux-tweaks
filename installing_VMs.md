# use qEmu and KVM instead of oracle VirtualBox

Switched since performance is much better under linux systems for virtualization.

Related packages to install:

```
sudo apt install libguestfs virt-manager virt-viewer dnsmasq vde2 bridge-utils netcat-openbsd
```

Make sure daemon is running

```
sudo systemctl start libvirtd
```

Auto start the service

```
sudo systemctl enable libvirtd
```

Reboot after installing

# The reason?

qEmu actually operates at the kernel level; this helps VMs run closer to real hardware and increases the actual performance of the system.

A good analogy of this is saying that VirtualBox is more like Python (ie operating at the software level; interpreted language), whereas qEmu runs more like C closer to the hardware using actual kernel modules to perform VM things.

# Converting .ova appliances to qEmu supported disks

For school / education use cases virtual machines are often distributed as .ova files to be imported into VirtualBox. Thankfully, these .ova files can be _CONVERTED_ into qemu disks and created into a virtual machine afterwards in virtmanager.

1. Extract the .ova file

```
tar xvf <ova-file-name>
```

2. Convert vmdk to qcow2 for each hard-disk using qemu-img

```
qemu-img convert -O qcow2 <source-disk.vmdk> <destination-disk.qcow2>
```

3. Now import this now .qcow disk into virtmanager and setup as usual.
