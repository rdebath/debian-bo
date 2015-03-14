This is the "Official" Debian 1.3, codename "bo"
------------------------------------------------

The repository contains files from both the binary and source CD-ROM
images, in addition it has the data files to allow jigdo-file to recreate
the original "Official" iso files.

The images were copied from physical CD-ROM's originally purchased
from a company called "Cheap*Bytes" in the USA. Unfortunatly, because
of the stupid US "munitions" laws of the time (that have since been
partially fixed) they do not contain any programs that can be defined as
"encryption" related and so make it easy for the US government to violate
the privacy of anyone they care to. As this was a direct violation of US
laws changes were made rather quickly once it became sufficiently public.

The commands for reconstructing the iso images are:

jigdo-file make-image --jigdo=iso/Debian-1.3.1-bo-binary.iso.jigdo *

jigdo-file make-image --jigdo=iso/Debian-1.3.1-bo-source.iso.jigdo *

The "jigdo-file" command is available in the current Debian/Ubuntu
package of the same name.

--------------------------------------------------------------------------------

Running under qemu
------------------

This version of Debian can be successfully installed and run using
"qemu-system-i386", however, on my host there are some issues.

1) Using KVM causes the system to hang during boot.
2) The default network card is too new but a "pcnet" device works nicely.
3) The "shutdown -h now" command does not successfully shutdown qemu.
4) The harddisk is very slow.

The startup command I use this this:

  qemu-system-i386 -m 32M \
    -hda debian_bo_i386.qcow2 \
    -cdrom iso/Debian-1.3.1-bo-binary.iso \
    -net nic,model=pcnet -net user,hostfwd=tcp:127.0.0.1:2023-:23 \
    -vga std -vnc :1 -monitor vc \
    -daemonize -nodefaults -no-reboot

Note that this includes the preferences of using VNC rather than SDL, a
'NAT' style network connection to substitute for a firewall and putting
a qemu monitor connection on Ctrl-Atl-2.  The "poweroff" problem is
worked around by making "reboot" halt the emulator.  But the slow disk
does not appear to have a solution as the kernel will not use DMA on any
of the IDE emulations, none of the SCSI emulations have working drivers
and the kernel predates AHCI.


