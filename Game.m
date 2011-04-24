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
    if ((self = [super init])){
        
        //Initializes default variables
        tick = 0;
        aggregateAcceleration = 0;
        
        // initializes new dude to the gamedude pointer
        // still need to init with theme dude
        self.gameState = JIGameNotStarted;
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


// Get's the dude's current threshold value
- (float) excitementLevel {
    return gameDude.excitement;
}


// Sets the scene based on theme data (is this necessary?)
- (void) setScene {
    
}

- (Dude*) gameDude {
    return gameDude;
}


- (Byte) motionToInputs:(CMDeviceMotion*)deviceMotion {
    
    Byte inputs = 0;
    // What happens here? Do I need to retain/release here?
    accelerationData = deviceMotion.userAcceleration;
    aggregateAcceleration = sqrt((accelerationData.x * accelerationData.x +
                            accelerationData.y * accelerationData.y +
                            accelerationData.y * accelerationData.z));
    rotationData = deviceMotion.rotationRate;
//    aggregateRotation = sqrt(rotationData.x * rotationData.x +
//                             rotationData.y * rotationData.y +
//                             rotationData.z * rotationData.z);

    aggregateRotation = fabs(rotationData.y);
    
    // If the aggregate acceleration exceeds a value, we should set shaking to yes
    if (aggregateAcceleration > SHAKINGTHRESHOLD)
    {
        inputs |= ISSHAKING;
        NSLog(@"Aggregate acceleration is %f",aggregateAcceleration);
    }

    if (aggregateRotation > ROTATIONTHRESHOLD)
    {
        inputs |= ISTWISTING;
        NSLog(@"Aggregate rotataion is %f",aggregateRotation);
    }
    return inputs;
}

// Increments a tick in the game, and handles all tick logic
- (void) goTick:(CMDeviceMotion*)deviceMotion {
    if (self.gameState == JIGameStarted)
    {
        //Handle all incrementing and such
        tick++;
//        NSLog(@"Started tick #: %i", tick);

        // Pass inputs to gameDude
        [gameDude handleInputs:[self motionToInputs:deviceMotion]];
//       NSLog(@"Excitement now       : %f", gameDude.excitement);
        
        // Run standard decay
        [gameDude decayExcitement];
//        NSLog(@"Excitement decayed to: %f", gameDude.excitement);

    }
    else
    {
        // We don't need to do anything here
    }
}

- (void) dealloc {
    [super dealloc];
    [gameDude release];
    //[gameScene dealloc];
    //[gameEventLibrary dealloc];
}

@synthesize gameState,tick,gameDude,accelerationData,aggregateAcceleration,aggregateRotation;

@end
