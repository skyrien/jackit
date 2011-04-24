//
//  Dude.h
//  JackIt
//
//  Created by Alexander Joo on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DECAYCONSTANT 0.01
#define EXCITEMENTMULTIPLIER 1
#define EXCITEMENTECHO 30

@interface Dude : NSObject {
	//lets get some variables here
	CGFloat excitement;
    CGFloat decayConstant;
    NSInteger excitementNum;
	// should add threshold dictionary here--this should be an array of structs
    
}

@property CGFloat excitement;
@property CGFloat decayConstant;
@property NSInteger excitementNum;

//method declarations should go here

//initialization
- (id)init;

/* // This method initializes this Dude with an inputed array of Thresholds
- (id)initWithThresholds:(NSArray)thresholds;
*/

// This method decays the excitement level per tick, and 
// returns the new value
- (void)decayExcitement;

// This method receives the inputs and returns the new value
- (void)handleInputs:(Byte)userInputs;


// Check thresholds
//- (NSArray)checkThresholds;

// This method updates the current arousal level based on inputs
// not ready yet

//- (float)updateArousal;
@end
