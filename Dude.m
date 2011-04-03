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
		excitement = 0.0;	
		decayConstant = 0.03;

        
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

- (CGFloat)decayExcitement {
    CGFloat subtractValue, decayValue, returnValue;
    subtractValue = (excitement - 1.0);
    if (subtractValue < 0) {
        subtractValue = 0;
    }
    decayValue = excitement * (1.0 - decayConstant);
    
    // determines the lower of the two, and returns it
    return excitement = (subtractValue < decayValue) ? subtractValue : decayValue;
}

- (CGFloat)handleInputs:(Byte)userInputs {
    CGFloat addToExcitement = 0.0;
    for (int x = 0; x < 8; x++) {
        addToExcitement += userInputs & 0x0001;
        userInputs = userInputs >> 1;
    }
    return excitement += addToExcitement;
}

@synthesize excitement,decayConstant;

@end
