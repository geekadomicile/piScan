Script to turn your raspberryPi into a scan server.

Tested with fujitsu fi-6130 duplex scanner.

How to install
--------------
	::

		$ sudo su
		$ apt-get update
		$ apt-get install git sane-utils imagemagick poppler-utils scanbd
        $ git clone https://github.com/geekadomicile/piScan.git
		$ adduser pi lp
		$ scanimage -L
		# Should find your scanner
		$ scanbd
		$ cp action.script text.script /usr/share/scanbd/scripts/
		$ cp scanbd.debian /etc/init.d/scanbd
		$ chmod 755 /etc/init.d/scanbd
		$ update-rc.d scanbd defaults

A few usefull links
-------------------
http://artem.gratchev.com/2015/01/home-scan-station-based-on-raspberry-pi/
http://eduardoluis.com/raspberry-pi-and-usb-network-scanner/

