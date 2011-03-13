//
//  Game.h
//  JackIt
//
//  Created by Alexander Joo on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dude.h"

@interface Game : NSObject {
// varaibles go here
    int clock, tick;
    BOOL gameRunning;
    Byte inputs;
    Dude* gameDude;
    //Scene* gameScene;
    //EventLibrary* gameEventLibrary;
}

// Initializes the game, and dependent objects such as Dude, Scene and EventLibrary
// Calls initWithTheme
- (id) init;

// Initializes the game with a particular input theme
- (id) initWithTheme:inputTheme;

// Collects UI inputs to generate output to Dude
- (Byte) collectInputs;

// Sets the scene based on theme data (is this necessary?)
- (void) setScene;

//
- (Dude*) gameDude;

// Increments a tick in the game, and handles all tick logic
- (BOOL) goTick;

@end
