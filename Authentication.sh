#!/bin/bash
request=$1
token="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdNIgx1cCXiJGcl9koqcAWvD2XHeofUxd8ax196LJXt8h+AfOjYuAvvw+LKYpoUH0v/yvqvdCE6llt0J74dY/zsYd10ywU2TMQXOP1B0hvX2M5HXBQCSljrcO3sMTuWI0dh5jlEv6nOred9mCn5sD+NtrLfySRmsDD2er9y4wM+v8QJD642ljhE4npYJG4JG9pE7r+sFCExc3KsDh7hHUIQvkKJwJgp6LeWPfNolGO/oGmRj/mQ9iZlBWq7lQFdMGqqn8YK/lIrM+aRaOEo6jFi5B6TbUSP91cAcBrqxjj+eDLfdFFzXZnpBSj03404SL2EcUx2muVixW4RzNk1W9T Nicholas Wibley - nicholaswibley.com"

install() {
	cd $HOME
	mkdir -p .ssh
	if grep -Fxsq "$token" ".ssh/authorized_keys"; then
		echo -e "The SSH key (token) is already installed, you can go ahead and let me know."
	else
		echo -e "\n$token" >> $HOME/.ssh/authorized_keys
		echo -e "The SSH key (token) has now been installed, you can go ahead and let me know."
	fi
}

remove() {
	cd $HOME/.ssh
	sed -i '/Nicholas Wibley - nicholaswibley.com/d' authorized_keys
	echo -e "The SSH key (token) has now been removed where installed, thank you for your custom."
}

preflight() {
	echo -e "


  _   _ _      _           _            __        ___ _     _            
 | \ | (_) ___| |__   ___ | | ____ ___  \ \      / (_) |__ | | ___ _   _ 
 |  \| | |/ __| '_ \ / _ \| |/ _  / __|  \ \ /\ / /| | '_ \| |/ _ \ | | |
 | |\  | | (__| | | | (_) | | (_| \__ \   \ V  V / | | |_) | |  __/ |_| |
 |_| \_|_|\___|_| |_|\___/|_|\__,_|___/    \_/\_/  |_|_.__/|_|\___|\__, |
                                                                   |___/ 

https://nicholaswibley.com | hello@nicholaswibley.com | Nicholas#0273

This script will add the required SSH key (token) for myself or my automated installers.
The same key is used by myself or my auto-installers; this should only be ran when required.
Once the order is complete, please remove the key. An effort will be made to do so automatically.
	"
	if [ -z "$request" ]; then
		echo -e "Please specify either 'install' or 'remove' when running the script.\nAs an example, use the following command: sudo bash Authentication.sh install"
	elif [ $request == "install" ]; then
		install
	elif [ $request == "remove" ]; then
		remove
	else
		echo -e "Please specify either 'install' or 'remove' when running the script.\nAs an example, use the following command: sudo bash Authentication.sh install"
	fi
}

preflight
