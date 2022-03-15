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

```
yum -S update-grub
update-grub
```

```
sudo grub-install <DRIVE /dev/sda usually>
```
