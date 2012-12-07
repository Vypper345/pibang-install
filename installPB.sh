#!/bin/bash
clear
echo "We will now install PiBang, you have 5 seconds to run for your life"
sleep 6s
cd /root
wget -O - http://pibanglinux.org/repo/Publickeylong.gpg.key | apt-key add -
clear
echo "deb http://pibanglinux.org/repo/ pibang main" >> /etc/apt/sources.list
echo "finished adding sources, will now dist-upgrade"
sleep 3s
apt-get update
yes | apt-get dist-upgrade
clear
echo "Time to remove Raspbian stuff"
sleep 3s
apt-get install -y thunar thunar-volman terminator raspi-setup
apt-get remove -y raspi-config 
apt-get remove --purge -y ace-of-penguins xinit lxde lxtask menu-xdg smartsim penguinspuzzle wpagui lxde-common lxde-core lxsession lxterminal lxinput lxrandr midori scratch audacious audacious-plugins audacious-plugins-data  lxappearance-obconf lxterminal lxlauncher lxmenu-data lxpanel  lxsession  lxsession-edit lxshortcut lxtask leafpad mtpaint ntp pcmanfm pidgin pidgin-data pidgin-libnotify pidgin-microblog  python-xklavier  sylpheed sylpheed-doc sylpheed-i18n sylpheed-plugins system-tools-backends xfburn xfce4-power-manager xfce4-power-manager-data xfconf xpad
apt-get autoremove --purge
apt-get autoclean
clear
echo "Will now install PiBang and associated packages"
sleep 3s
apt-get install -y aptitude
apt-get install --no-install-recommends -y xserver-xorg-video-fbdev
apt-get install --no-install-recommends -y xserver-xorg xinit
aptitude install -y openbox obmenu obconf 
aptitude install -y abiword abiword-common abiword-plugin-grammar abiword-plugin-mathview blueman catfish network-manager-gnome midori dmenu
aptitude install -y gmrun geany catfish htop gimp gpicview gftp transmission-gtk xchat gigolo abiword evince arandr lxappearance gparted dosfstools obmenu obconf tint2 nitrogen conky synaptic xcompmgr gmrun xfce4-screenshooter ceni arandr gimp deadbeef xfce4-notifyd 
aptitude install -y cb-exit cb-pipemenus cb-welcome borrowed-crunchbang-themes faenza-icon-theme pibang-configs htop pibang-configs pibang-backgrounds xscreensaver
# I know this is a repeat, but aptitude gets pissed and sometimes removes stuff so I want to make sure they are all there.
aptitude install -y thunar thunar-volman terminator raspi-setup pbmenu-apps
clear
echo "fixing Raspi-Setup"
sleep 3s
sed /etc/profile.d/raspi-config.sh -i -e "s/raspi-config/raspi-setup/" 
clear
echo "config stuff time"
sleep 3s
sed /etc/NetworkManager/NetworkManager.conf -i -e "s/managed=false/managed=true/"
sed /etc/NetworkManager/NetworkManager.conf -i -e "s/iface wlan0 inet manual/iface wlan0 inet dhcp/"
cd /home/pi
rm python_games
rm -r Desktop
mkdir ./{Downloads,Documents,Videos,Images,Pictures,Music,Scripts}
cd /home/pi/Images
ln -s /usr/share/backgrounds
chmod -R 766 /usr/share/{backgrounds,pixmaps,icons,themes}
cd /etc/skel
cp -r .config /home/pi/
cp -r .xscreensaver /home/pi/
cp -r .conkyrc /home/pi/
cp -r .omxplayer /home/pi
chown -R pi:pi /home/pi
chown -R pi:pi /home/pi/*
chown -R pi:pi /home/pi/.*
clear
echo "One last double check"
sleep 3s
apt-get autoremove --purge
apt-get autoclean
echo "Finished! you will be rebooted momentarily"
sleep 20s && reboot
exit 0
