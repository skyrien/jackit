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
        excitementNum = 0;
		decayConstant = DECAYCONSTANT;

        
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

- (void)decayExcitement {
    CGFloat subtractValue, decayValue;
    subtractValue = (excitement - 0.5);
    if (subtractValue < 0) {
        excitement = 0;
        return;
    }
    decayValue = excitement * (1.0 - decayConstant);
    
    // determines the lower of the two, and sets it to excitement
    excitement = (subtractValue <= decayValue) ? subtractValue : decayValue;
}

- (void)handleInputs:(Byte)userInputs {
    CGFloat addToExcitement = 0.0;
    for (int x = 0; x < 8; x++) {
        addToExcitement += userInputs & 0x0001;
        userInputs >>= 1;
    }
    if (addToExcitement > 0)
    {
        excitement += (addToExcitement * EXCITEMENTMULTIPLIER);
        excitementNum++;
    }
    else excitementNum = 0;
}

@synthesize excitement,decayConstant,excitementNum;

@end
