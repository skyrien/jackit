//
//  Game.m
//  JackIt
//
//  Created by Alexander Joo on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"


@implementation Game

- (id)init{

    // superclass gets initialized first
    if (self == [super init]){
        
        //Initializes default variables
        clock = tick = inputs = 0;

        // initializes new dude to the gamedude pointer
        // still need to init with theme dude
        gameRunning = NO;
        gameDude = [[Dude alloc] init];
		
	}
    return self;
    // this is the theme version of the call
	//return [self initWithTheme:defaultTheme]; //initWithTheme:(NSArray)thresholds;
}

- (id) initWithTheme:(id)inputTheme {
    // Theme import logic goes here
    return self;
}
    
// Collects UI inputs to generate output to Dude
- (Byte) collectInputs {
    Byte collectedInputs = 0;
    return collectedInputs;
}

// Get's the dude's current threshold value
- (float) excitementLevel {
    return [gameDude excitement];
}


// Sets the scene based on theme data (is this necessary?)
- (void) setScene {
    
}

- (Dude*) gameDude {
    return gameDude;
}


// Increments a tick in the game, and handles all tick logic
- (int) goTick {
    //Handle all incrementing and such
    tick++;
 
    NSLog(@"Started tick #: %i", tick);
    // Pass inputs to gameDude
    [gameDude handleInputs:[self collectInputs]];
    NSLog(@"Excitement now       : %f", [gameDude excitement]);
    
    // Run standard decay
    [gameDude decayExcitement];
    NSLog(@"Excitement decayed to: %f", [gameDude excitement]);
    // All done, return current tick number
    return tick;
}
@end
