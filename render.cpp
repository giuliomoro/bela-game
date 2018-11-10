/*
#include <Bela.h>
#include <aubio/aubio.h>

void initOSC();
fvec_t *pitch;
smpl_t amp;
extern "C" {
	int aubio_pitch_setup(float sampleRate);
	void process_block(fvec_t * ibuf, fvec_t * obuf);
	void aubio_pitch_render(BelaContext *context, void *userData);
};

bool setup(BelaContext *context, void *userData)
{
	initOSC();
	return !aubio_pitch_setup(context->audioSampleRate);
}

void render(BelaContext *context, void *userData)
{
	aubio_pitch_render(context, userData);

	static auto lastUpdate = context->audioFramesElapsed;
	if(context->audioFramesElapsed - lastUpdate > 5000)
	{
		lastUpdate = context->audioFramesElapsed;
		rt_printf("pitch: %7.3f, amp: %6f\n", fvec_get_sample(pitch, 0), 10*amp);
	}
}

void cleanup(BelaContext *context, void *userData)
{

}
*/
