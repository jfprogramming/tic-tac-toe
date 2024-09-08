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
echo "run install apt-get install texlive-full manullay as hitting enter on the keyboard \n
      several times to get the commands to progress is a known issue"
# sudo apt-get install texlive-full

# Install the encryption library 
pip install bcrpyt 

#setup data directory
sudo mkdir /data
cd /data
sudo mkdir database
sudo chmod 777 database
sudo mkdir config
sudo chmod 777 config
