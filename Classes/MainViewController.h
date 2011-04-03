//
//  MainViewController.h
//  JackIt
//
//  Created by Alexander Joo on 1/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import "Game.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    IBOutlet UILabel *excitementCounter; // This is the "arousal number"
    IBOutlet UILabel *tickCounter; // This is the game tick
    IBOutlet UILabel *decayValue; // This is the game tick
    IBOutlet UIProgressView *excitementBar; // This is a visual representation of arounsal
    Game *theGame; // a pointer to a game object
    NSString* currentExcitement; // May or may not be useful
    NSTimer* gameTimer;
    
}

// This function starts the game
- (IBAction)ticklePickle:(UIButton *)sender;

- (IBAction)setExcitementButton:(UIButton *)sender;

- (IBAction)setDecayValue:(UISlider *)sender;

// I don't know what this one does, it was autogenerated
- (IBAction)showInfo:(id)sender;

- (void)gameLoop;

@end
