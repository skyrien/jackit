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
        
        // initializes new dude to the gamedude pointer
        // still need to init with theme dude
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

// Increments a tick in the game, and handles all tick logic
- (BOOL) goTick {
    
    
}
@end
