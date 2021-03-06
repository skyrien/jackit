//
//  Game.h
//  JackIt
//
//  Created by Alexander Joo on 3/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreMotion/CMMotionManager.h>
#import "Dude.h"

// Useful variables
#define JIGameNotStarted 0
#define JIGameStarted 1
#define JIGamePaused 2
#define JIGameOver 3

#define ISSHAKING 0x01
#define ISTOUCHED 0x02
#define ISBLOWING 0x04
#define ISTWISTING 0x08
#define ISBUTTONED 0x10
#define SHAKINGTHRESHOLD 1.0
#define ROTATIONTHRESHOLD 15.0

@interface Game : NSObject {
// varaibles go here

    NSInteger tick;
    NSInteger gameState;
    Dude* gameDude;
    //Scene* gameScene;
    //EventLibrary* gameEventLibrary;
    
    CMAcceleration accelerationData;
    CMRotationRate rotationData;
    CGFloat aggregateAcceleration;
    CGFloat aggregateRotation;
}

@property(nonatomic) NSInteger gameState;
@property(nonatomic) NSInteger tick;
//@property(nonatomic) Byte inputs;
@property(readonly) CMAcceleration accelerationData;
@property(readonly) CGFloat aggregateAcceleration;
@property(readonly) CGFloat aggregateRotation;
@property(readonly) Dude* gameDude;

// Initializes the game, and dependent objects such as Dude, Scene and EventLibrary
// Calls initWithTheme
- (id) init;

// Initializes the game with a particular input theme
- (id) initWithTheme:inputTheme;

// Sets the scene based on theme data (is this necessary?)
- (void) setScene;

- (Dude*) gameDude;

- (Byte) motionToInputs:(CMDeviceMotion*)deviceMotion;

// Increments a tick in the game, and handles all tick logic
- (void) goTick:(CMMotionManager*)motionManager;

@end
