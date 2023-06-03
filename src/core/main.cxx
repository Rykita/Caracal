#include <iostream>
#include "SDL/window.h"
#include "SDL/input.h"


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
				case SDL_KEYDOWN:
					// Notify input class!!
					InputHnd()->SendInputMsg(event.key.keysym); break;
			}
		}
	}

	//Cleanup
	SDL_Quit();
    return 0;
}