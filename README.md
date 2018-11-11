# Dynamic Duo

Team \#7 submission for the first Red Hackathon held in Studio One at Abbey Road on 10-11 November 2018.

**♬ Singing with your DJ friend like gamifying a jam! ♬**

## Requirements

Item | What is it for?               
------------------ | --------------------- 
[Bela](http://bela.io/) | a maker platform makes everything in a real-time fashion 
[Pure Data](https://puredata.info/) | a programming language for multimedia
[Audio Commons resources](http://isophonics.net/abrhackday) | get audio samples to jam with using Python 
other stuff | microphone, headphone, midi sequencer etc.

You also need to install some other dependencies:

```
# Pd external
apt-get install pd-iemlib

# aubio (python didn't work :( )
wget https://aubio.org/pub/aubio-0.4.7.tar.bz2
tar xvf aubio-0.4.7.tar.bz2
cd aubio-0.4.7
./waf configure build && ./waf install
ldconfig

# some npm install: express, osc-min, socket.io

# if you want to retrieve Creative Commons samples on Bela, you will need an internet connection (ethernet or wi-fi dongle). Then you might need to install pip, libdev-sox, pysox, sox, and download sounds into the 'samples' folder according to your 9 keywords of choice with the following command.

python main.py background-sound keyword1 keyword2 keyword3 keyword4 keyword5 keyword6 keyword7 keyword8
```

## How to jam?

- Get voice from the microphone input of player `Duo-1` such that pitch and loudness are estimated using Bela.

- Audio samples are retrieved based on the keywords selected by player `Duo-2`, who can control the samples later by a midi sequencer (or other gestural interfaces) to jam with `Duo-1`.

- Based on both audio and visual feedback, two players can gamifying the jam.

- To be precise on the visualization, `Duo-1` can make the avatar jump higher through singing higher, and move faster by singing louder. In the meanwhile, how the blocks look like is decided by `Duo-2`.

- In terms of audio feedback, global tempo can be increased by louder voice from `Duo-1`. Each block is associated to an audio sample decided by `Duo-2`.
