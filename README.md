Some tweaks used to customize my EndeavorOs Arch Linux setup

# /etc/libinput/local-overrides.quirks

Adds some configuration of the libinput drivers for touchpads. Setup so the touch detection area is more generous since it often would think my palm is present for no reason and stop the cursor. Log out and back in to reload this config.

# /etc/udev/hwdb.d

Used to remap some hardware keys on the keyboard of my macbook pro. Namely remap the eject key to be a fwd delete key instead (since I replaced the CD drive with another SSD). Also mapped right command to to be leftmeta as well so it does everything that left command button does (keyboard shortcuts etc)

To reload config run

```
sudo systemd-hwdb update
sudo udevadm trigger
```

This file is specific to a 2012 mid non retina Macbook Pro

# /home/martindimitrov/.config/brave-flags.conf

Custom configuration for what brave browser launch icon does.

This is is .local so that apt upgrades do not reset this. If there is a worthwhile change in this .desktop from upstream it will need to be manually added later (shouldn't be a huge problem though for now...)

Main changes are:

Enable Wayland support for Brave Rewards; probably once Chromium upstream is updated this will not be needed

```
--enable-features=UseOzonePlatform --ozone-platform=wayland
```

Enable 2 finger touchpad overflow history navigation

```
---enable-features=TouchpadOverscrollHistoryNavigation
```

These additional flags are added into the brave-flags.conf file under .config

# /etc/systemd/logind.conf

This file has changes to how LID state changes are handled. Normally I want a lid close to suspend (even when plugged in or docked).

To make changes or disable lid functionanilty just add 'ignore' to the end of these options

```
HandleLidSwitch=suspend
HandleLidSwitchExternalPower=suspend
HandleLidSwitchDocked=suspend
```

# /etc/UPower/UPower.conf

Set IgnoreLid=true this disables any lid detection from GNOME meaning that it will sleep when lid closed even if docked. (will respect the rules in /etc/systemd/login.conf)

# /home/martindimitrov/.themes/martin/gnome-shell/gnome-shell.css

This file will overrite some default css from Ubuntu. Right now only using it to make the notifications not as wide since default is too much. Set to 300px MAX. Other UI quirks can be added here as normal CSS code

# AppImageLauncher

Install application to handle .AppImages:

```
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt install appimagelauncher
```

This allows you to add shortcuts to appimages and store them in a central location ~/Applications

# setting GRUB so it boots directly into the OS

Had some weird boot options so sometimes it would not boot directly into OS (stuck in GRUB terminal).

These commands should also be used in a LIVE CD in case of some boot problems (from resizing or moving partitions)

```
yum -S update-grub
update-grub
```

```
sudo grub-install <DRIVE /dev/sda usually>
```

Sometimes if I break my install somehow; I can recover grub from a live USB. To do this simply mount both the linux partition and boot partition and chroot in:

```
# mount main partition and chroot
sudo mount /dev/sdb3 /mnt
sudo arch-chroot /mnt

# mount efi partition
sudo mount /dev/sdb1 /boot/efi
```

Then simply just run the same as above so 

```
sudo update-grub
sudo grub-install
```

# /home/martindimitrov/.bashrc

Storing my bash configs here. Only really added a few macros in there.

To reload the config after changing it run

```
source .bashrc
```

# OpenPenTablet

Install this package to get tablet support. For use with handwriting tools (tutoring etc)...

After installing from AUR 

`yay -S opentabletdriver`

it must be enabled from systemctl user:

`systemctl enable --user opentabletdriver`

I also had to reboot before it would work. Configure through GUI.


# /etc/auto-cpufreq.conf

Alter the auto-cpufreq configuration. Since switching to i7 using 'performance' governor spins up the fans like
crazy (despite the thermal repaste). Switched to 'conservative' on power to allow for a more pleasant thermal experience.

Perhaps make further optimizations later to limit the max frequencies, but for now it will stay as such.

To reload the config after making changes to `/etc/auto-cpufreq.conf`:

`sudo systemctl reload auto-cpufreq.service`

# Mac startup chime

If you clear NVMRAM it will full blast the mac startup sound. Fix described in AUR involves writing to NVRAM vars to ensure that it is set to 0.

https://wiki.archlinux.org/title/mac#Mute_startup_chime