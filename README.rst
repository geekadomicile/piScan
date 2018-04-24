Script to turn your raspberryPi into a scan server.

Tested with fujitsu fi-6130 duplex scanner.

How to install
==

Prepare your hardware (using Mac OS X)
--

Download zip image of debian OS from raspberrypi.org,
then use Etcher to copy zipped image to your raspberryPi uSD card.

Then open a terminal and type :
        ::
                $ cd /Volumes/boot/
                $ touch ssh
                $ cd

Unmount uSD card from your Mac and insert it into the raspberryPi.

Connect and power up your raspberryPi.

To login use :
- login:pi
- password: raspberry

Install this software
--
	::

		$ sudo su
		$ apt-get update
		$ apt-get install vim git scanbd imagemagick poppler-utils
                $ git clone https://github.com/geekadomicile/piScan.git
                $ cd piScan
		$ adduser pi lp
		$ scanimage -L
		# Should find your scanner
		$ cp action.script test.script /usr/share/scanbd/scripts/
		$ cp scanbd.conf /etc/scanbd/
                $ service scanbd stop
                $ service scanbd start
		$ ssh-keygen -t rsa
                $ ssh piscan@ongat.com mkdir -p .ssh
                $ cat .ssh/id_rsa.pub | ssh piscan@ongat.com 'cat >> .ssh/authorized_keys'
                $ systemctl enable scanbd
                $ reboot

A few usefull links
==
http://artem.gratchev.com/2015/01/home-scan-station-based-on-raspberry-pi/
http://eduardoluis.com/raspberry-pi-and-usb-network-scanner/

