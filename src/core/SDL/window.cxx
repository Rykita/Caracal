#include "window.h"

Window::Window(int width, int height, std::string name)
{

    Window::height = height;
    Window::width = width;

    window = SDL_CreateWindow(name.c_str(), SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, Window::width, Window::height, 0);

    //Get window surface
    screenSurface = SDL_GetWindowSurface(window);

    //Fill the surface white
    SDL_FillRect(screenSurface, NULL, SDL_MapRGB(screenSurface->format, 255, 255, 255));

    SDL_UpdateWindowSurface(window);
}

Window::~Window()
{
    //Destroy window
    SDL_DestroyWindow(window);
}

void Window::SetTitle(const std::string name)
{
    SDL_SetWindowTitle(window, name.c_str());
}
