#!/bin/bash
# Updated 2019-03-04 @ 13:12:27 MST by rob@sigma
echo "Installing secure-delete for KDE Plasma 5..."
#set x-1
CURRENTD=$(dirname "$0") # looking at the current location of this file
CURRENTDIR=$CURRENTD"/"  # add a slash at the end of the located path for upcoming operations
if [ "$CURRENTD" = "." ];then  # looking if it was navigated into the dir of this file
   CURRENTDIR=""               # current directory changes fron "." to ""
fi

# local/system kde5-folders
P_S=`kf5-config --path services`   # path_services

S_P=${P_S#*:}   # System Path remove prefix ending in ":"
echo "System Path is:" $S_P

L_P=${P_S%%:*}   # Local Path remove suffix after ":"
echo "Local Path is:" $L_P
L_P_SM="$L_P"ServiceMenus     # local path service menus-destination for desktop files
echo $L_P_SM
echo "Desktop files will go to "$L_P_SM"."

# create local bin-folder unless it exists
if [ -d "$HOME"/bin ]; then
   echo "Directory" "$HOME"/bin "not created-already exists."
else
   mkdir "$HOME"/bin    create local bin-folder
   echo "Created directory" "$HOME"/bin "."
fi

# create local servicemenu-folder unless it exists
if [ -d "$L_P" ]; then
   echo "Directory" "$L_P" "not created-already exists."
   if [ -d "$L_P_SM" ]; then
      echo "Directory" "$L_P_SM" "not created-already exists."
   else
      mkdir "$L_P_SM"   # create local servicemenu-folder
      echo "Created directory" "$L_P_SM"  "."
   fi                         
else
   mkdir "$L_P"   # create local path-folder
   echo "Created directory" "$L_P"  "."
   mkdir "$L_P_SM"   # create local servicemenu-folder
   echo "Created directory" "$L_P_SM"  "."
fi                         

cd "$CURRENTDIR"src  # change to src-dir inside the installation folder

# copy *.desktop-files to local ServiceMenu dir
cp -p -v secure_delete_folder_kde5.desktop $L_P_SM
cp -p -v secure_delete_kde5.desktop $L_P_SM

# copy all scripts to local bin dir
cp -p -v securedeletefolder.sh "$HOME"/bin
cp -p -v securedelete.sh "$HOME"/bin
# make them executable
chmod -v 755 "$HOME"/bin/securedeletefolder.sh 
chmod -v 755 "$HOME"/bin/securedelete.sh 

echo "Installation done!"    # message for successful installation
kdialog --msgbox "Installation done! \n \nTo uninstall simply delete securedeletefolder.sh and securedelete.sh from your ~/bin directory, and  
delete secure_delete_kde5.desktop and secure_delete_folder_kde5.desktop from your $L_P directory."
#set x-1
