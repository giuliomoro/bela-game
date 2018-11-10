/*
  Copyright (C) 2003-2013 Paul Brossier <piem@aubio.org>

  This file is part of aubio.

  aubio is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  aubio is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with aubio.  If not, see <http://www.gnu.org/licenses/>.

*/

#include <Bela.h>
#include <aubio/aubio.h>
#include <stdio.h>

aubio_pitch_t *o;
aubio_wavetable_t *wavetable;
fvec_t *pitch;
smpl_t amp;

int mix_input = 0;
int buffer_size = 2048;
char_t * pitch_unit = "default";
char_t * pitch_method = "default";
uint_t hop_size = 128;
smpl_t pitch_tolerance = 0.0; // will be set if != 0.
float samplerate;
smpl_t silence_threshold = -90.;
unsigned int directChannel = 0;
unsigned int otherChannel = 1;
float cancellationGain = 1;


void process_block(fvec_t * ibuf, fvec_t * obuf)
{
  smpl_t freq;
  //get the pitch
  aubio_pitch_do (o, ibuf, pitch);
  //if ( !usejack && ! sink_uri ) return;
  fvec_zeros(obuf);
  freq = fvec_get_sample(pitch, 0);
  // get the amplitude
  amp = aubio_level_lin (ibuf);
  aubio_wavetable_set_amp ( wavetable, 100*amp);
  aubio_wavetable_set_freq ( wavetable, freq );
  if (mix_input)
    aubio_wavetable_do (wavetable, ibuf, obuf);
  else
    aubio_wavetable_do (wavetable, obuf, obuf);
}

void aubio_pitch_render(BelaContext *context, void *userData)
{
	smpl_t audioIn[context->audioFrames];
	for(unsigned int n = 0; n < context->audioFrames; ++n)
	{
		audioIn[n] = audioReadNI(context, n, directChannel) - cancellationGain * audioReadNI(context, n, otherChannel);
	}
	fvec_t ibuf = {
		.length = context->audioFrames,
		.data = audioIn
	};
	fvec_t obuf = {
		.length = context->audioFrames,
		.data = context->audioOut
	};
	process_block(&ibuf, &obuf);
}

int aubio_pitch_setup(float sampleRate) {
  samplerate = sampleRate;
  int ret = 0;
  printf ("pitch method: %s, ", pitch_method);
  printf ("pitch unit: %s, ", pitch_unit);
  printf ("buffer_size: %d, ", buffer_size);
  printf ("hop_size: %d, ", hop_size);
  printf ("tolerance: %f\n", pitch_tolerance);

  o = new_aubio_pitch (pitch_method, buffer_size, hop_size, samplerate);
  if (o == NULL) { ret = 1; goto beach; }
  if (pitch_tolerance != 0.)
    aubio_pitch_set_tolerance (o, pitch_tolerance);
  if (silence_threshold != -90.)
    aubio_pitch_set_silence (o, silence_threshold);
  if (pitch_unit != NULL)
    aubio_pitch_set_unit (o, pitch_unit);

  pitch = new_fvec (1);

  wavetable = new_aubio_wavetable (samplerate, hop_size);
  aubio_wavetable_play ( wavetable );

  //examples_common_process((aubio_process_func_t)process_block,process_print);

  return ret;
beach:
  return ret;
}


void aubio_pitch_cleanup()
{
  del_aubio_pitch (o);
  del_aubio_wavetable (wavetable);
  del_fvec (pitch);
}
