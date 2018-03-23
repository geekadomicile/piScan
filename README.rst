Script to turn your raspberryPi into a scanner server.

Tested with fujitsu fi-6130 duplex scanner.

How to install
--------------
	::

		$ sudo su
		$ apt-get update
		$ apt-get install sane-utils
		$ apt-get install imagemagick
		$ apt-get install poppler-utils
		$ apt-get install scanbd
		$ adduser pi lp
		$ scanimage -L
		# Should find your scanner
		$ scanbd
		$ cp action.script /usr/share/scanbd/scripts/
