#include "input.h"

InputHandler gInputHnd;
InputHandler* InputHnd()
{
	return &gInputHnd;
}

void InputHandler::SendInputMsg(SDL_Keysym keysym)
{
	switch (keysym.sym)
	{
		case SDLK_w:
			break;
		case SDLK_s:
			break;
		case SDLK_a:
			break;
		case SDLK_d:
			break;
	}
}

InputHandler::InputHandler()
{

}

InputHandler::~InputHandler()
{

}
