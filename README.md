This is the official script to install PiBang to a vanilla Rasbian Image.


########################################################################
#                                                                      #
#       Until I remove this it is here for development only            #
#                                                                      #
########################################################################





THIS ABSOLUTLEY WILL NOT WORK ON AN IMAGE THAT IS NOT NEW
If you choose to try this on an image that is not new it WILL require
modification, otherwise it will ruin your day and train your cat to shit
on your pillow. You have been warned.



Usage instructions:

1) Install Rasbian on a card that is AT LEAST 4GB, less will not work.

    sudo dd bs=1M if=Rabian.img of=/dev/sdcard
    
2) Eject card and re-insert. Then resize with Gparted, and expand the 
ext4 partition to the remainder of the drive

	sudo gparted
	
3) Boot the Raspberry Pi with the new card. At the config screen,
hit <escape>

4) ssh into the Pi from your main computer. 
	user:pi
	password:raspberry
	
5) become root

    sudo bash
   
6) install the script

    nano /bin/installPB
   
Cut and paste the script into this file

7) make it executable

    chmod +x /bin/installPB
   
8) run it as root

	installPB
	
Go read "war and peace", this will take a while. It will automatically reboot and you will be in PiBang.
