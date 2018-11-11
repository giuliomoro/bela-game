#include <Bela.h> // just for rt_printf and map()
#include <Scope.h>
extern Scope scope;
float gSpeedX;
float gX = 0;
float gY = 0;

void sendDataToBrowser(float x, float y); // midi-osc.cpp
static float locationSampleRate;

void setupLocation(float newLocationSampleRate)
{
	locationSampleRate = newLocationSampleRate;
}

float mapNote(float note)
{
	float minNote = 36;
	float maxNote = 72;
	float range = maxNote - minNote;
	float rel = (note - minNote)/range;
	// TODO: should clip?
	return rel;
}

float smoothX(float newX)
{
	float positionAlpha = 0.9;
	static float oldX = 0;
	float x = newX * (1 - positionAlpha) + oldX * positionAlpha; 
	oldX = x;
	return x;
}

// If you think it's a funky name, remember this was a hackathon
void computeLocationSendToBrowser(float db, float note)
{
	static float pastX = 0;
	float minSpeedX = 0.01;
	float maxSpeedX = 0.05;
	float speedX = map(db, -20, 0, minSpeedX, maxSpeedX);
	if(speedX < minSpeedX) {
		speedX = minSpeedX;
	}

	float x = smoothX(pastX + speedX);
	float y = mapNote(note);
	pastX = x;
	while(x >= 1){
		x -= 1.f;
	}
	gSpeedX = speedX;
	gX = x;
	gY = y;
	sendDataToBrowser(gX, gY);

	static int count = 0;
	if((count & 15) == 0)
	{
		rt_printf("x: %10f, y: %10f, speed: %10f, db: %10f\n", x, y, gSpeedX, db);
	}
	count++;
	//scope.log(x, y, 0, 0);
}

