from query import *
#from queryfreesound import *
import sys
import sox

keywords = sys.argv[1:]
names = ['ambient', 'drum1', 'drum2', 'drum3', 'drum4', 'drum5', 'drum6', 'drum7', 'drum8']
for i,k in enumerate(keywords):
    retrieve_sound(k, names[i])


    # create trasnformer
    tfm = sox.Transformer()
    tfm.gain(gain_db=0.0, normalize=True, limiter=True, balance=None)
# create the output file.
    tfm.build('samples/'+names[i]+'.mp3', 'samples/'+names[i]+'.wav')
