/**********************************************************************
jack.h

Header file for iJack. Includes variables and function declarations.
Program settings are also here.

(c) 2010 Alexander Joo

***********************************************************************/

//Game Modes
#define TEXTDEBUG 1

//Global variables -- these will later go into a separate file
#define TRUE 1
#define FALSE 0

//Configurable fields
#define CLIMAX 100
#define THRESHOLD1 25
#define THRESHOLD2 50
#define THRESHOLD3 90
#define IDEAL_TICK_RATE 25 // target ticks per second
#define MAX_INPUT 3 // maximum combined inputs
#define TICKS_PER_WINDOW 10 // number of ticks which compose a game window
#define AROUSAL_DECAY -0.01
#define VERSION "0.1"

// Game timing variables
const int CLOCKS_PER_TICK = (CLOCKS_PER_SEC / IDEAL_TICK_RATE);

// initialize()
// Initializes all variables, thresholds and configurations
void initialize();

// getInputs()
// This function handles all input from the user
void getInputs(int *);


// evalInputs()
// Evaluates the multiple inputs and returns the amount to increment the
// arousal meter
int evalInputs(int *);

// evalArousal
// Evalutes the input arousal value, and performs all required actions.
//
// Parameters:
// float currentvalue -- the current arousal state
// Returns an INT
int evalArousal(float currentValue);

// renderBar
// Evalutes the input arousal value, and renders the appropriate arousal bar
//
// Parameters:
// float currentvalue -- the current arousal state
// Returns nothing
void renderBar(float currentValue);

// arousalDecay
// Decays the current arousal value based on the number of ticks since last
float arousalDecayTo(float currentArousalValue, int ticksSince);