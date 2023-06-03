#pragma once
#include <SDL.h>
#include <string>
class Window
{
public:
	Window(int width, int height, std::string name);
	~Window();
	void SetTitle(const std::string name);
private:
	int width;
	int height;
	SDL_Window* window = NULL;
	SDL_Surface* screenSurface = NULL;
};