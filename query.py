#based on https://github.com/mabara/oscaudiocommons by Mathieu Barthet

from Queue import Queue, Empty
import requests
import urllib
import json
import random
import os
from multiprocessing import Process

url = 'http://m2.audiocommons.org/api/audioclips/search'

#home = expanduser("~")
sounddir = "./samples/" #home + "./samples/"

MIN_DUR = 0.3 #minimum duration (s) for retrieved sounds
MAX_DUR = 20 #maximum duration (s) for retrieved sounds
SHOWRES = 40 #only displays first SHOWRES results from Freesound
SOUND_RANGE = 10 #play random sound within first SOUND_RANGE retrieved sounds


def download_sound(q,soundurl,soundpath):
    #download sound from Freesound given specified URL

    #to specify a Freesound key
    #params = dict(token=FREESOUND_KEY)
    #response = requests.get(soundurl, params=params)
    response = requests.get(soundurl)

    print(urllib.unquote(response.url).decode('utf8'))

    try:
        assert response.status_code == 200 #response OK

        #stores the sound at specified location
        with open (soundpath, 'wb') as f:
            f.write(response.content)

    except AssertionError:
        print('There is an issue with the HTTP GET request to download the sound. You may need to specify a Freesound key.')



def retrieve_sound(keyword, name):

    if name == 'ambient':
        MAX_DUR = 20
    else:
        MAX_DUR = 2

    soundpath = [] #stays empty if no sounds can be found matching the criteria

    queue = Queue() #queue for process

    print("Query")


    #specifies the query through keyword and filtering options
    #in this example, the selected source content provider is Freesound
    params = dict(pattern=keyword, source="freesound")
    response = requests.get(url, params=params)
    print(urllib.unquote(response.url).decode('utf8'))

    try:
        assert response.status_code == 200 #response OK

        restext = response.text
        #print(restext)

        resdic = json.loads(restext)

        if (resdic!={} and resdic["results"]!=[]): #checks that the query returned results
            nsounds = len(resdic["results"][0]["members"])

            print("Number of results for query %s: %d"%(keyword, nsounds))

            if nsounds>=1: #if there is at least 1 sound matching the criteria

                #download random result within first SOUND_RANGE sounds if no of sounds
                #is greater than 1
                if nsounds==1:
                    sound_index=0
                else:
                    sound_index = random.randint(0,min(SOUND_RANGE,nsounds))

                print("Sound number %d has been picked up randomly."%sound_index)
                soundname = resdic["results"][0]["members"][sound_index]["content"]["title"]
                idnumber = resdic["results"][0]["members"][sound_index]["content"]["@id"]
                print ('ID NUMBER {}'.format(idnumber))
                print("Sound name: %s"%soundname)

                #picks an mp3 version of the sound
                for i in resdic["results"][0]["members"][sound_index]["content"]["availableAs"]:
                    audioencoding = i["hasAudioEncodingFormat"]
                    if resdic["results"][0]["members"][sound_index]["content"]["license"] == "http:/creativecommons.org/publicdomain/zero/1.0/":
                        print('PUBLIC DOMAIN - CC0')
                        print(resdic["results"][0]["members"][sound_index]["content"]["license"])
                        print("Author: %s" %resdic["results"][0]["members"][sound_index]["content"]["author"])
                    else:
                        print('REQUIRES ATTRIBUTION')
                        print(resdic["results"][0]["members"][sound_index]["content"]["license"])
                        print("Author: %s" %resdic["results"][0]["members"][sound_index]["content"]["author"])

                    print('AUDIO ENCODING {}'.format(audioencoding))
                    if (audioencoding=="ebu-codecs:_8.4" or "mp3" in audioencoding): #mp3
                        soundurl = i["locator"] #selects the first mp3 version
                        print("Sound url: %s"%soundurl)
                # soundurl = 'https://freesound.org/apiv2/sounds/' + idnumber.split(':')[-1] + '/download/'
                        break

                print("Downloading: {}".format(soundurl))
                # print("its a WAAAAAAAAAAV")
                # format = soundname.split('.')[-1]
                # print(format)

                # if ('wav' in format) == False:
                    # print('NOT WAV')
                    # retrieve_sound(keyword, name)

                soundpath = os.path.join(sounddir, name + '.mp3' )
                print("Sound download location: {}".format(soundpath))

#                 if os.path.exists(soundpath) == 0: #if the file has not yet been downloaded
                    #starts a process to download the sound
                p = Process(target=download_sound, args=(queue, soundurl, soundpath))
                p.start()
                p.join() # this blocks until the process terminates
                print("Sound downloaded.")

#                 else: #sound already exists
#                     print("Sound already exists.")
        else:
            print("The query did not provide any results.")

    except AssertionError:
        print('There is an issue with the HTTP GET request to query sounds.')

    return soundpath
