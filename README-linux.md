# when networking goes out
1. check /etc/resolv.conf, i saw junk in there (a 10.something mullvad ip)
2.
    sudo service openvpn stop
3. check /etc/resolv.conf again, i saw a 192 or a 127 ip in there
4. manually edit to 8.8.8.8 (or something)
5.
    sudo systemctl restart systemd-resolved.service

# mouse pointer speed
1. xinput
  - lists devices, look for named mice, usually multiple entries
2. xinput list-props <id>
  - the pointer speed is 'libinput Accel Speed', which is listed atm as
  - the full name of the prop, not including the parens at the end
  - i've found -0.65 to be a good speed
3. xinput set-prop <id> <prop> <value>

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


