# TicTacToe Poky Build Setup and Configuration 

## Clone down poky project 
- git clone git://git.yoctoproject.org/poky
- checkoout kirkstone branch 
- change to the new cloned repo e.g. "cd poky"


## Clone down meta-qt6 repo 
- git clone https://code.qt.io/yocto/meta-qt6.git
- git checkout 6.7.2 

## Clone down meta-reasberrypi repo
- git clone https://github.com/agherzan/meta-raspberrypi.git
- git clone git://git.yoctoproject.org/meta-raspberrypi


## clone down meta-openembedded 
- git clone git://git.openembedded.org/meta-openembedded
   
   
## update the build/conf/local.conf file 
- 
   
   
## update the build/conf/bblayers.conf file 
- add in the meta directories added in to the project 
- meta-qt6
- meta-openembedded\meta-pyhton
- meta-openembedded\meta-oe
- meta-raspberrypi
- meta-custom


## Create meta-custom layer 
- user bitbake layer command 
- bitbake-layers create-layer meta-custom


## add in recipes-qt directory 
- create sub directory named after projects application e.g. "tictactoe"


## create the application bb recipe file 
- Proejcts/poky/meta-custom/recipes-qt/tictactoe/tictactoe.bb 
- added in:
  - inhert qt6-qmkae
   
   
## create a sub-directory in recipes-qt/tictactoe called files 
- place the tictactoe binary file here
- place the initd script to start the application at boot 
   
   
## update meta-custom/recipes-qt/tictactoe/tictactoe.bb 
- include initd script 
- include binary file in src: 


## create the recipes-core directory 
- create the recipe file for adding in /data directory and /applicaation directory  
   
   
## Bake the Image 
- source oe-init-build-env
- bitbake core-image-sato

