apt update
if jq ".DE" "/options.json" | grep -q "KDE Plasma (Heavy)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y dolphin \
    gwenview \
    kde-config-gtk-style \
    kdialog \
    kfind \
    khotkeys \
    kio-extras \
    knewstuff-dialog \
    konsole \
    ksystemstats \
    kwin-addons \
    kwin-x11 \
    kwrite \
    plasma-desktop \
    plasma-workspace \
    qml-module-qt-labs-platform \
    systemsettings
    sed -i 's/applications:org.kde.discover.desktop,/applications:org.kde.konsole.desktop,/g' /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/config/main.xml
    cp /startwm-kde.sh /defaults/startwm.sh
fi
if jq ".DE" "/options.json" | grep -q "XFCE4 (Lightweight)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y firefox \
    mousepad \
    xfce4-terminal \
    xfce4 \
    xubuntu-default-settings \
    xubuntu-icon-theme
    rm -f /etc/xdg/autostart/xscreensaver.desktop
    cp /startwm-xfce.sh /defaults/startwm.sh
fi
if jq ".DE" "/options.json" | grep -q "I3 (Very Lightweight)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends firefox \
    i3 \
    i3-wm \
    stterm
    update-alternatives --set x-terminal-emulator /usr/bin/st
    cp /startwm-i3.sh /defaults/startwm.sh
fi
if jq ".DE" "/options.json" | grep -q "GNOME 42 (Very Heavy)"; then
    # most of this is taken from udroid (https://github.com/RandomCoderOrg/jammy-gnome/)
    DEBIAN_FRONTEND=noninteractive apt-get install -y firefox
    apt-get install -y gnome-shell \
    gnome-shell-* \
    dbus-x11 \
    gnome-terminal \
    gnome-accessibility-themes \
    gnome-calculator \
    gnome-control-center* \
    gnome-desktop3-data \
    gnome-initial-setup \
    gnome-menus \
    gnome-text-editor \
    gnome-themes-extra* \
    gnome-user-docs \
    gnome-video-effects \
    gnome-tweaks \
    gnome-software \
    language-pack-en-base \
    mesa-utils \
    xterm \
    yaru-*
    
    # load dconf settings
    if [ -f /jammy.dconf.conf ]; then
        # export dbus session address
        export $(dbus-launch)

        dconf load / < /jammy.dconf.conf || {
            echo -e "\t: dconf load failed.."
        }
    else
        echo -e "\t: dconf file not found.."
    fi

    for file in $(find /usr -type f -iname "*login1*"); do 
        mv -v $file "$file.back"
    done

    echo "sudo chmod u+s /usr/lib/dbus-1.0/dbus-daemon-launch-helper" >> ~/.bashrc
    echo "sudo chmod u+s /usr/lib/dbus-1.0/dbus-daemon-launch-helper" >> /config/.bashrc

    mv -v /usr/share/applications/gnome-sound-panel.desktop /usr/share/applications/gnome-sound-panel.desktop.back

    echo "export XDG_CURRENT_DESKTOP=GNOME" >> ~/.bashrc
    echo "export XDG_CURRENT_DESKTOP=GNOME" >> /config/.bashrc

    apt-get remove -y \
        gnome-power-manager \
        gnome-bluetooth \
        gnome-software \
        gpaste \
        hijra-applet gnome-shell-extension-hijra \
        mailnag gnome-shell-mailnag \
        gnome-shell-pomodoro gnome-shell-pomodoro-data
    
    cp /startwm-gnome.sh /defaults/startwm.sh
fi
if jq ".DE" "/options.json" | grep -q "Cinnamon"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y firefox \
    cinnamon
    cp /startwm-cinnamon.sh /defaults/startwm.sh
fi
if jq ".DE" "/options.json" | grep -q "LXQT"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y firefox
    apt-get install -y lxqt
    cp /startwm-lxqt.sh /defaults/startwm.sh
fi
chmod +x /defaults/startwm.sh
rm /startwm-kde.sh /startwm-i3.sh /startwm-xfce.sh