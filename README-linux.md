# when networking goes out
1. check /etc/resolv.conf, i saw junk in there (a 10.something mullvad ip)
2.
    sudo service openvpn stop
3. check /etc/resolv.conf again, i saw a 192 or a 127 ip in there
4. manually edit to 8.8.8.8 (or something)
5.
    sudo systemctl restart systemd-resolved.service
6.
    sudo /etc/init.d/network-manager restart


# mouse pointer speed
Edit `/usr/share/X11/xorg.conf.d/40-libinput.conf`

add 2 lines to the first section before `EndSection`:

```
    Option "AccelProfile" "flat"
    Option "AccelSpeed" "1.05"
```

# what processes do not "want to sleep"
- systemd-inhibit
- systemd-inhibit --list --mode=block


# graphics drivers

> https://askubuntu.com/questions/28033/how-to-check-the-information-of-current-installed-video-drivers

    lspci | grep VGA
    lsmod | grep "kms\|drm"
    find /dev -group video
    cat /proc/cmdline
    find /etc/modprobe.d/
    cat /etc/modprobe.d/*kms*
    ls /etc/X11/xorg.conf
    glxinfo | grep -i "vendor\|rendering"
    grep LoadModule /var/log/Xorg.0.log

# volume / sound

alsamixer
(also pulseaudio)

# zfs/zpool

> I unplugged everything from the mobo and plugged the sata cables in a different order, my zfs drive moved from sdd to sda. every other drive mounted fine but i had to re-import zfs. also not sure if i'll need to do this again next boot to make it permanent. ultimately it was real easy

```
    sudo zpool import
```

listed the pool just fine, and all i had to do was

```
    sudo zpool import Quantum
```


