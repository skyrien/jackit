//
//  Dude.m
//  JackIt
//
//  Created by Alexander Joo on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Dude.h"


@implementation Dude

- (id)init{
	// superclass gets initialized first	
	if (self == [super init]){
		excitement = 10000.0;	
		decayConstant = 0.9999;

        
	}
	return self; //initWithThresholds];
}

/* Lets get to this when the framework is done
- (id)initWithThresholds{
	// superclass gets initialized first	
	if (self = [super init]){
		excitement = 0.0;	
		
	}
	return self;
}
*/

// This method gets the current arousal level
- (float)excitement {
    return excitement;
}

// This method sets the current arousal
- (void)setExcitement:(float)inputExcitement {
    excitement = inputExcitement;
}

- (float)decayExcitement {
    return excitement *= decayConstant;
}

- (float)handleInputs:(Byte)userInputs {
    float addToExcitement = 0.0;
    for (int x = 0; x < 8; x++) {
        addToExcitement += userInputs & 0x0001;
        userInputs = userInputs >> 1;
    }
    return excitement += addToExcitement;
}

@end
