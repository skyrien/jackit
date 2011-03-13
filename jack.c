/**********************************************************************
jack.c

Main code file for iJack. Includes main function, and core logic.

(c) 2010 Alexander Joo

**********************************************************************/


#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>

#include "jack.h"


void initialize()
{
	//If the user set an image, set is as the background here.
}

void getInputs(int userInput[])
{


}

int evalInputs(int arousalInputs[])
{
	int addBy = 0;
	int i;
	for (i = 0; i < 8; i++)
	{
		addBy += arousalInputs[i];
	}
	return addBy;
}

int evalArousal(float currentValue)
{
	int returnKey = 0;
	if (TEXTDEBUG == 1)
	{
		if (currentValue >= THRESHOLD1)
		{
			printf("Yeah baby!\n");
			returnKey = 1;
		}

		if (currentValue >= THRESHOLD2)
		{
			printf("More, more more! \n");
			returnKey = 2;
		}
		if (currentValue >= THRESHOLD3)
		{
			printf("So fucking close!!! \n");
			returnKey = 3;
		}
		if (currentValue >= CLIMAX)
		{
			printf("OMG OMG OMG! \n");
			returnKey = 10;
		}
		return returnKey;
	}
	
}


void renderBar(float currentValue)
{
	// If the value is zero (or less) do nothing
	if (currentValue <= 0.0) return;
}

float arousalDecayTo(float currentArousalValue, int ticksSince)
{
	float newArousal = currentArousalValue + (AROUSAL_DECAY)*ticksSince;
	if (newArousal > 0)
		return newArousal;
	else return 0;
}

int main()
{
	// Declare / Initialize everything
	float arousal = 0.0; // starting arousal state
	int tickCounter = 0; // current game tick
	int lastInputTick = 0; // current game tick
	int gameover = 0;	//
	int exitPressed = 0;
	int arousalInput[8];
	int currentState = 0;
	int *updowning, *shaking, *touching, *rotating, *blowing;
	char pressedChar;
	int addBy, i;
	int currentms;
	clock_t currentClock, sleepClock, intervalClock, nextClock;
	currentClock = clock(); // sets current tick clock
	intervalClock = 0;
	sleepClock = 0; // sets *previous* clock (currentClock from last tick)
	currentms = currentClock / (CLOCKS_PER_SEC / 1000); // milliseconds since start

	for (i = 0; i < 8; i++)
	{
		arousalInput[i] = 0;
	}
	
	updowning = &arousalInput[0];
	shaking = &arousalInput[1];
	touching = &arousalInput[2];
	rotating = &arousalInput[3];
	blowing = &arousalInput[4];
	// arousalInput array indicates current tick's input
	// index 0 = lengthwise up down
	// index 1 = shaking
	// index 2 = touching
	// index 3 = rotating (along axis)
	// index 4 = blowing
	// index 5-7 = unassigned

	/*** INITIALIZE GAME
	Things that happen here:
	- Declare and initialize varaibles
	- Set the tick size (10 ms) according to the system clock
	*/
	initialize();
		
	/* MAIN GAME LOOP
	Each tick represents one cycle through the main loop.
	
	Things that happen here:
	- Act on UI input: button presses, shaking, etc...
	- Evaluate current arousal
	- Render UX
	- Increment ticks
	*/
	while(gameover != 1)
	{

		/******* PRE-TICK LOGIC GOES HERE *******/
		currentClock = clock(); // sets current tick clock
		nextClock = currentClock + CLOCKS_PER_TICK; // target next clock
		currentms = currentClock / (CLOCKS_PER_SEC / 1000); // milliseconds since start

		//clear inputs to 0
		*updowning = *shaking = *touching = *rotating = *blowing = 0;
		//NEED CODE HERE

		/******* KEYBOARD MODE GOES HERE *******/
		if (TEXTDEBUG == 1)
		{
			system("cls"); // Clear's the screen; there are buffering issues though...
			printf("JackIt, by skyrien (Version: %s) \n", VERSION);
			printf("Time elapsed (ms): %d \n", currentms); // 
			printf("Last tick duration (ms): %d \n", (intervalClock * 1000) / CLOCKS_PER_SEC);
			printf("Game tick: %d \n", tickCounter);
			printf("Arousal level: %f \n", arousal);
			printf("What inputs would you like? (you can specify up to eight) \n");
			printf("<u>updown, <s>shaking, <t>touching, <r>rotating, <b>blowing, <q>quit \n \n");

			// This is the new polling mechanism for key presses
			if (kbhit() != 0)
			{
				// Need to get all keys that are pressed at this time
				// reads buffer, gets one character at a time--should we try to get more?
				pressedChar = getch();
				switch(pressedChar)
				{
				case 'u':
					*updowning = 1;
					break;
				case 's':
					*shaking = 1;
					break;
				case 't':
					*touching = 1;
					break;
				case 'r':
					*rotating = 1;
					break;
				case 'b':
					*blowing = 1;
					break;
				case 'q':
					//If user pressed exit, quit the game/app
					gameover = 1;
					break;
				default:
					break;
					//nothing happens here
				}
			}

		}
		else getInputs(arousalInput); // this is normal input
		
		/* ACT ON INPUTS */
		// addBy is the amount to add to the arousal counter for this tick
		addBy = evalInputs(arousalInput);
		
		/* ACT ON AROUSAL LEVEL */
		// If input is above zero, add the appropriate value, otherwise, decay
		// Otherwise decay the value
		if (addBy > 0)
			lastInputTick = tickCounter;
		arousal += addBy;
		arousal = arousalDecayTo(arousal, tickCounter - lastInputTick);

		/******* THIS TICK'S LOGIC GOES HERE *******/

		// Check current arousal, and act on it
		currentState = evalArousal(arousal);

		if (currentState >= 10)
		{
			printf("You just spooged! WHOOOOoOOOOOOO!!!\n");
			
		}

		/******* OUTPUT GOES HERE *******/

		// Regardless of output, render the arousal bar
		renderBar(arousal);
		
		//sleep here if not at the time yet
		//remember, interval clock is currentclock - prevclock (at start of loop)
		
		//prevClock = currentClock; // sets *previous* clock (currentClock from last tick)
		//	currentClock = clock(); // sets current tick clock
		intervalClock = clock() - currentClock; // this becomes the number of clock
												// ticks it took to get here
		sleepClock = CLOCKS_PER_TICK - intervalClock;

		if (sleepClock > 0)
		{
			Sleep(sleepClock);
		}
		else //this means we're running over
		{
			//do we care?
		}
		//Increment current game tick
		tickCounter++;

	} // end of game loop
	
	/******* CLEANUP CODE GOES HERE *******/
	
}