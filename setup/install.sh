sudo apt-get update
sudo apt-get upgrade 

# Qt Install 
cd ~/Downloads 
sudo wget qt-online-installer-linux-x64-4.8.0.run

sudo chmod +x qt-online-installer-linux-x64-4.8.0.run 
sudo ./qt-online-installer-linux-x64-4.8.0.run 

sudo apt-get install git
sudo apt-get install libgl-dev 
sudo apt-get install xcb
sudo apt-get install libxcb-cursor0 
sudo apt-get install libssl-dev
sudo apt-get install doxygen
sudo apt-get install graphviz

sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update

echo "run install apt-get install texlive-full manullay as hitting enter on the keyboard \n
      several times to get the commands to progress is a known issue"     
# sudo apt-get install texlive-full

# packages to assist in building Poky
sudo apt install gawk \
                 wget \
                 git \
                 diffstat \
                 unzip \
                 texinfo \
                 gcc \
                 cmake \
                 build-essential \
                 chrpath \
                 socat \
                 cpio \
                 python3 \
                 python3-pip \
                 python3-pexpect \
                 xz-utils \
                 debianutils \
                 iputils-ping \
                 python3-git \
                 python3-jinja2 \
                 python3-subunit \
                 zstd liblz4-tool \
                 file \
                 locales \
                 libacl1 \
                 libgtest-dev \
                 nodejs \
                 vim \
                 neovim \
                 curl 
                              
                 

echo "done installing packages..."
                 
# Un-comment to compile gtest framework
# cd /usr/src/gtest
# sudo cmake CMakeLists.txt
# sudo make
                 
sudo locale-gen en_US.UTF-8


# Setup GTest Libs
sudo apt-get install libgtest-dev
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make

# Install the encryption library 
pip install bcrypt

#setup data directory
sudo mkdir /data
cd /data
sudo mkdir database
sudo chmod 777 database
sudo mkdir config
sudo chmod 777 config
