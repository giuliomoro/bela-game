# Prerequisites

```
#Pd external
apt-get install pd-iemlib

#aubio (python didn't work :( )
wget https://aubio.org/pub/aubio-0.4.7.tar.bz2
tar xvf aubio-0.4.7.tar.bz2
cd aubio-0.4.7
./waf configure build && ./waf install
ldconfig
# some npm install: express, osc-min, socket.io

#If you want to retrieve Creative Commons samples on Bela, you will need an internet connection (ethernet or wi-fi dongle).
Then you might need to install pip, libdev-sox, pysox, sox, and download sounds into the 'samples' folder according to your 9 keywords of choice with the following command.

python main.py background-sound keyword1 keyword2 keyword3 keyword4 keyword5 keyword6 keyword7 keyword8
```
