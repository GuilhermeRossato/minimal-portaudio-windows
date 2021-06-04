#include <stdio.h>
#include <math.h>
#include "./portaudio/include/portaudio.h"

void main(void) {
	printf("%d\n", Pa_GetVersion());
	return;
}