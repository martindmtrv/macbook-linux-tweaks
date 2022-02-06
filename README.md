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
