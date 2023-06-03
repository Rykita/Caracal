#ifndef INPUT_HANDLER_H
#define INPUT_HANDLER_H
#pragma once
#include <SDL.h>
#include <iostream>

class InputHandler {
public:
	InputHandler();
	~InputHandler();
	void SendInputMsg(SDL_Keysym keysym);
};

extern InputHandler* InputHnd();

#endif // INPUT_HANDLER_H