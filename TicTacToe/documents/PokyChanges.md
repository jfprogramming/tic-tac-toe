# Files Edited for TicTacToe Poky build 

## cloned down Poky repo 
- git clone git://git.yoctoproject.org/poky.git

## build/conf/local.conf
- Added in tictactoe application to the `IMAGE_INSTALL` List:
  - IMAGE_INSTALL:append = " qtbase qtdeclarative qtmultimedia tictactoe"
 
 
## build/conf/bblayers.conf
  ```
  BBLAYERS ?= " \
  /home/jfinn/Projects/poky/poky/meta \
  /home/jfinn/Projects/poky/poky/meta-poky \
  /home/jfinn/Projects/poky/poky/meta-yocto-bsp \
  /home/jfinn/Projects/poky/poky/meta-qt6 \
  /home/jfinn/Projects/poky/poky/meta-openembedded/meta-python \
  /home/jfinn/Projects/poky/poky/meta-openembedded/meta-oe \
  /home/jfinn/Projects/poky/poky/meta-custom \
  "
  ```

## Created meta-custom directory
  - **Created MIT License file md5 checksum value**
  - `jfinn@jfinn-virtual-machine:~/Projects/poky/poky$ cat meta-custom/recipes-qt/tictactoe/LICENSE `

  ```
  Copyright (c) [2024] [Jesse Finneman]

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
  ```

- **Created tictactoe_1.0.bb recipe file**
  - **meta-custom/recipes-qt/tictactoe/tictactoe_1.0.bb**
  - Added in start up script 
  - Added in reference to start up script stored in -> meta-custom/recipes-qt/tictactoe/files/tictactoe 
  - `inherit qt6` 
  - set license md5 checksum value
 
## Startup Script 
- Added in start up script -> **meta-custom/recipes-qt/tictactoe/files/tictactoe**
   ```sh
  #!/bin/sh
  # /etc/init.d/tictactoe
  #
  # chkconfig: 345 99 10
  # description: tic-tac-toe

  case "$1" in
      start)
    echo "Starting TicTacToe..."
    /application/TicTacToe &
    ;;
      stop)
    echo "Stopping TicTacToe..."
    # Command to stop your application
    ;;
      restart)
    $0 stop
    $0 start
    ;;
      *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
    ;;
  esac

  exit 0
  ```

## meta-custom/conf/layer.conf  
 - Added in `styhead` to `LAYERSERIES_COMPAT_meta`
  ```
  # We have a conf and classes directory, add to BBPATH
  BBPATH .= ":${LAYERDIR}"

  # We have recipes-* directories, add to BBFILES
  BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"

  BBFILE_COLLECTIONS += "meta-custom"
  BBFILE_PATTERN_meta-custom := "^${LAYERDIR}/"
  BBFILE_PRIORITY_meta-custom = "6"

  LAYERSERIES_COMPAT_meta-custom = "dunfell gatesgarth hardknott honister kirkstone langdale styhead"
  ```


- In `meta-custom` directory there is `recipes-qt` and `recipes-core` directory 
  - `recipes-core` is for adding in the filesystem changes to add in `/data`
- **NOTE**: in the `recipes-core` directory I had a sub directory `init-scirpts` that had the tictactoe start up script and bb file `tictactoe_1.0.bb` but have since removed them. 
- Assigned a licenses file md5 value in the recipes in the `recipes-qt` directory 


## Cloned meta-qt6 repo 
- `https://code.qt.io/yocto/meta-qt6.git\` \(is this the correct repo?\) 
- Edited `meta-qt6/conf/layer.conf`
- Adedd in `styhead` to ```LAYERSERIES_COMPAT_qt6-layer = "dunfell gatesgarth hardknott honister styhead"```


- Removed the changes to add in qt5
- Only adding in qt6 now
- **Note**: build issue with qt6 

- In tictactoe.bb `inherit qt6` line is throwing a build error
  - **Note**: I'm on `6.2.2` branch and my `meta-qt6/classes` directory doesn't contain a `qt6.bbclass` file but `qt6-qmake.bbclass`


## ls ../meta-qt6/classes/
```
jfinn@jfinn-virtual-machine:~/Projects/poky/poky/build$ ls ../meta-qt6/classes/
disable-build.bbclass  populate_sdk_qt6_base.bbclass  qt6-cmake.bbclass  qt6-paths.bbclass  qt6-qmake.bbclass  srcrev-update.bbclass
```

## meta-qt6 repository
```
jfinn@jfinn-virtual-machine:~/Projects/poky/poky/meta-qt6$ git branch
* 6.2.2
  6.5
  dev
```

## Current Error I'm facing is getting qt6 built in...
```
jfinn@jfinn-virtual-machine:~/Projects/poky/poky/build$ bitbake core-image-sato
Loading cache: 100% |############################################################################################################################################| Time: 0:00:01
Loaded 4339 entries from dependency cache.
ERROR: ParseError at /home/jfinn/Projects/poky/poky/meta-custom/recipes-qt/tictactoe/tictactoe_1.0.bb:7: Could not inherit file classes/qt6.bbclass               
ERROR: Parsing halted due to errors, see error messages above
```


## Next steps
- Get qt6 configured in the bb file appropriately. 

- Touch screen driver and baking it into my poky build. 
  - adjust/edit kernel module to do this... 




