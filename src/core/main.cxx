#include <iostream>
#include "SDL/window.h"

/* 
I'm gonna go on a short rant: I have to use WinMain() on WIN32/64 instead of main()... because?? I guess
Microsoft really hates portability...
*/

int main(int argc, char* argv[])
{
	//Initialize SDL
	if (SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		std::cout << "SDL could not initialize! SDL_Error: %s\n" << SDL_GetError();
	}

	Window newWin = Window(1920, 1080, "CaracalCore");

	bool quit = false;
	while (!quit)
	{
		SDL_Event event;
		while (SDL_PollEvent(&event))
		{
			switch (event.type)
			{
				case SDL_QUIT:
					quit = true; break;
			}
		}
	}

	//Cleanup
	SDL_Quit();
    return 0;
}