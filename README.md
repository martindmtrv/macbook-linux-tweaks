Some tweaks used to customize my Ubuntu setup

# /etc/libinput/local-overrides.quirks

Adds some configuration of the libinput drivers for touchpads. Setup so the touch detection area is more generous since it often would think my palm is present for no reason and stop the cursor. Log out and back in to reload this config.

# /etc/pulse/daemon.conf

To enable instant volume changes (for some reason default is to delay which is a big janky).

To reload after changing:

```
pulseaudio --k
pulseaudio --start
```

# /etc/udev/hwdb.d

Used to remap some hardware keys on the keyboard of my macbook pro. Namely remap the eject key to be a fwd delete key instead (since I replaced the CD drive with another SSD)

To reload config run

```
sudo systemd-hwdb update
sudo udevadm trigger
```

This file is specific to a 2012 mid non retina Macbook Pro running Ubuntu 21.04

# /usr/share/applications/brave-browser.desktop

Custom configuration for what brave browser launch icon does. Main changes are:

Enable Wayland support for Brave Rewards; probably once Chromium upstream is updated this will not be needed

```
--enable-features=UseOzonePlatform
--ozone-platform=wayland
```

Enable 2 finger touchpad overflow history navigation

```
---enable-features=TouchpadOverscrollHistoryNavigation
```

These additional flags are added into the execute command of the Brave Browser icon like so:

```
Exec=/usr/bin/brave-browser-stable --enable-features=UseOzonePlatform,TouchpadOverscrollHistoryNavigation --ozone-platform=wayland

```

# /etc/systemd/logind.conf

This file has changes to how LID state changes are handled. Normally I want a lid close to suspend (even when plugged in or docked).

To make changes or disable lid functionanilty just add 'ignore' to the end of these options

```
HandleLidSwitch=suspend
HandleLidSwitchExternalPower=suspend
HandleLidSwitchDocked=suspend
```
