@ echo off

rem Flush any write-cached disk blocks before we leave DOS. 
smartdrv /c

loadlin.exe linux root=/dev/ram ro initrd=root.bin
