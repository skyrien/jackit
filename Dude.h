//
//  Dude.h
//  JackIt
//
//  Created by Alexander Joo on 2/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Dude : NSObject {
	//lets get some variables here
	CGFloat excitement;
    CGFloat decayConstant;
	// should add threshold dictionary here--this should be an array of structs
    
}

@property CGFloat excitement;
@property CGFloat decayConstant;

//method declarations should go here

//initialization
- (id)init;

/* // This method initializes this Dude with an inputed array of Thresholds
- (id)initWithThresholds:(NSArray)thresholds;
*/

// This method decays the excitement level per tick, and 
// returns the new value
- (CGFloat)decayExcitement;

// This method receives the inputs and returns the new value
- (CGFloat)handleInputs:(Byte)userInputs;


// Check thresholds
//- (NSArray)checkThresholds;

// This method updates the current arousal level based on inputs
// not ready yet

//- (float)updateArousal;
@end
