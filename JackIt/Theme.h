//
//  Theme.h
//  JackIt
//
//  Created by Alexander Joo on 3/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dude.h"
//#import "EventLibrary.h"
//#import "Scene.h"

@interface Theme : NSObject {
    Dude* themeDude;
    //EventLibrary* themeEventLibrary;
    //Scene* themeScene;
}

// This function initializes a basic theme
- (id) init;

// This function initializes a theme from a file
//- (id) initFromFile;


// This function takes the current theme, and serializes it into a binary
- (void) exportToFile;

@end
