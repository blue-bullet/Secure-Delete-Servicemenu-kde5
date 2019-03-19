# Secure-Delete-Servicemenu-kde5
A service menu to secure delete your files and folders in dolphin file manager.
Routines have been modified to work in Plasma 5.  Original work was done by Vanbosco
see https://www.opendesktop.org/p/998460/ to work in kde3 and kde4.

Updated 2019-03-07 @ 15:58:36 MST by rob@sigma

Place this in a subdirectory like /home/yourusersname/Downloads/kde_secure_delete, make certain install.sh is executable with permissions 755.
In konsole:              

cd ~/Downloads/kde_secure_delete # change directory to where install.sh resides

chmod 755 install.sh             # change permissions to make it executable

stat -c "%a %n" install.sh       # verify 

./install.sh                     # install routines 

## optional step - Remove downloaded routines (no longer needed) (remove comment # to run):

## rm * -r                        # Will do the optional step. Make certain cd is still one set above so only downloaded files are removed.
  
install.sh will create and place the necessary kde desktop files to allow you to run securedelete and securedeletefolders from Dolphin file manager.  
This was not kept up to date by the author (vanbosco on desktop.org) so I just copied and modified his routines to make them work under KDE Plasma 5.

Make certain srm is installed by entering in a konsole:
which srm
you should see:
/usr/bin/srm

If not, then install it in konsole:
sudo apt install secure-delete   
