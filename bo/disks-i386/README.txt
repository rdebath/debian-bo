This is Debian 1.3 . Installation instructions can be found in
ftp:current/install.html (read with your web browser) or
current/install.txt (plain text).

IMPORTANT: Last-minute problems

xdm will not let you log in after installation. You can repair the
problem by running "shadowconfig" _before_ you log off after installation.
If you do not want shadow passwords, run "shadowconfig on; shadowconfig off".
If you do want shadow passwords, run "shadowconfig on".
This will be fixed in 1.3.1 .

If you are installing an X server, install the "xbase" package in
a separate "dpkg" or "dselect" session before you install an X server.
Otherwise, the X server may not be able to configure once installed,
because its configuration script needs programs in "xbase". This will
be fixed in 1.3.1 .

This section is only for people who are upgrading an older _Debian_
system. Everyone else must follow the instructions under "Installing a
New Debian System". You can upgrade automatically via FTP, or from CD
or disk. With this release, it is very important to upgrade our "dpkg"
package tool first, before you upgrade other packages in an older
Debian system. To do this, change into the Debian-1.3/binary-i386/base
directory on your CD or use FTP or some other means to get the ".deb"
files mentioned below. As root, run these commands:

    dpkg --clear-avail
    dpkg -i ldso_*.deb
    dpkg -i libc5_*.deb
    dpkg -i dpkg_*.deb dpkg-ftp_*.deb
    dpkg --purge --force-depends texbin

Once that has been done, you should be able to upgrade the entire system
automatically using our "dselect" tool. If you are connected to the Internet
you will not need to retrieve any other files manually, "dselect" will
automatically retrieve and install the rest of Debian 1.3 for you.

If you upgrade from Debian 1.1 to Debian 1.3, on a system where Debian
1.2 has never been installed, you can expect to run dselect about 4
times to complete the installation. There will be a number of error
messages leading to termination of "dselect", but these are an artifact
of the package order and your skipped upgrade to 1.2, and can be safely
ignored.
