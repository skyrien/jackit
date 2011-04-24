//
//  MainViewController.m
//  JackIt
//
//  Created by Alexander Joo on 1/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

// Initializes the game if not yet present
- (Game *)theGame {
	if (!theGame)
    {
        // This initializes the game, dude, scene, event library
		theGame = [[Game alloc] init];
        gameTimer = [NSTimer scheduledTimerWithTimeInterval:TICKDURATION target:self selector:@selector(gameLoop) userInfo:nil repeats:(YES)];
        
        motionManager = [[CMMotionManager alloc] init]; // CoreMotion manager
        //        motionManager.accelerometerUpdateInterval = TICKDURATION;
        //        motionManager.gyroUpdateInterval = TICKDURATION;
        motionManager.deviceMotionUpdateInterval = TICKDURATION;
        deviceMotion = motionManager.deviceMotion;

    }
	return theGame;
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
    // This initializes the game object
    theGame = [self theGame];
}

- (void)viewDidAppear:(BOOL)animated {
    // This sets up the view to begin accepting event data
    [self becomeFirstResponder];
    
}


// KEY BEHAVIOR FUNCTIONS START HERE
- (BOOL)canBecomeFirstResponder {
    return YES;
}

/* // SHAKING HANDLING DATA
// Handles beginning of iOS motion, such as shaking
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        currentInputs |= ISSHAKING; // if zero will set it to one
        NSLog(@"Shaking STARTED at tick: %i", theGame.tick);
    }
}

// Handles effective completion of ending a motion event
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        currentInputs &= ~ISSHAKING; // if one, this needs to set it to zero
        NSLog(@"Shaking lasting for %i ticks ENDED at tick %i",theGame.gameDude.excitementNum,theGame.tick);
    }
    
}

// Handles the cancellation of a motion event
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        currentInputs &= ~ISSHAKING; // if one, this needs to set it to zero
        NSLog(@"Shaking lasting for %i ticks CANCELLED at tick %i",theGame.gameDude.excitementNum,theGame.tick);
    }
}
*/

// GAME FUNCTIONS START HERE

// Starts game if not started, pauses if it is started
- (IBAction)ticklePickle:(UIBarButtonItem *)sender {
//    NSInteger tickNumber;
    if (theGame.gameState == JIGameNotStarted || theGame.gameState == JIGamePaused) {
        theGame.gameState = JIGameStarted;
        sender.title = @"Pause";

        //Enables perodic sensor updates with new data
//        [motionManager startAccelerometerUpdates];
//        [motionManager startGyroUpdates];
        if (motionManager.deviceMotionAvailable)
            [motionManager startDeviceMotionUpdates];
        NSLog(@"Game started. Current tick: %i", theGame.tick);
    }
    else if (theGame.gameState == JIGameStarted) {
        theGame.gameState = JIGamePaused;
        sender.title = @"Start";

        //Disables perodic sensor updates with new data
//        [motionManager stopAccelerometerUpdates];
//        [motionManager stopGyroUpdates];
        [motionManager stopDeviceMotionUpdates];
        NSLog(@"Game paused. Current tick: %i", theGame.tick);
    }
}

/*
- (IBAction)setDecayConstant:(UISlider *)sender {

    if (sender.value)
    {
        [theGame gameDude].decayConstant = sender.value;
        decayValue.text = [NSString stringWithFormat:@"%f", sender.value];        
    }
}
*/
 
- (void) gameLoop {
    //Initiates a tick
    
    [theGame goTick:motionManager.deviceMotion];
    
    // These are UI outputs based on game state
    accelData.text = [NSString stringWithFormat:@"x:%f y:%f z:%f", theGame.accelerationData.x,theGame.accelerationData.y,theGame.accelerationData.z];
    twistData.text = [NSString stringWithFormat:@"Rotation is: %f", theGame.aggregateRotation];
    tickCounter.text = [NSString stringWithFormat:@"Current Tick: %i", theGame.tick];
    excitementCounter.text = [NSString stringWithFormat:@"%f",[[theGame gameDude] excitement]];
    excitementBar.progress = [[theGame gameDude] excitement] * 0.01;
    
}

- (IBAction)setExcitementButton:(UIButton *)sender {
    NSString *value = [[sender titleLabel] text];
    NSLog(@"The excitement value set to: %@", value);        
    [[theGame gameDude] setExcitement:[value floatValue]];
    
}

// ALL THE BELOW WERE AUTOGENERATED

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}

// This is the (i) button that switches to the flipside view
- (IBAction)showInfo:(id)sender {    
    
    
    /* //This code ends the game if it is running
    if ((theGame.gameState == JIGameStarted)||(theGame.gameState == JIGamePaused))
        theGame.gameState = JIGameOver;
    */
    
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
    [theGame release];
}


@end
