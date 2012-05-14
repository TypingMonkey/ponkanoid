//
//  HelloWorldLayer.m
//  Ponkanoid
//
//  Created by Kevin Bruin on 4/23/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"
#import "Paddle.h"
#import "Ball.h"
#import "Block.h"


Paddle *paddle1;
Paddle *paddle2;
Ball *ball;



// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(void) nextFrame:(ccTime)dt {
    
    [paddle1 move:dt];
    [paddle2 move:dt];
    
    
    // Code below iterates through all Balls, and for each Ball node through all Block nodes in order to
    // handle collisions
    for (Ball * currentBall in [self children])  if ([currentBall isKindOfClass:[Ball class]]) {
        // iterate through all Ball nodes        
        [currentBall move:dt];                        

        for (CCNode * node in [self children]) if ([node isKindOfClass:[Block class]]) { 
              // iterate through all Block nodes
                if ([currentBall collideWithBlock:(Block*)node]) [self removeChild:node cleanup:YES]; // cleanup when collision occurs
            } // end of Block iteration                       
        [currentBall collideWithPaddle:paddle1];
        [currentBall collideWithPaddle:paddle2];
    } // end of Ball iteration
    
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [self processTouch:touch];  
    return YES;
}

 

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    [self processTouch:touch];
}
     
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    [self processTouch:touch];    
}


- (void) processTouch:(UITouch *)touch {
    CGPoint location = [self convertTouchToNodeSpace: touch];    
    if (location.x < 60) { // Player 1
        //paddle1.position = ccp(50, location.y);  
        paddle1.targetY = location.y;
    } else if (location.x > 964) { // Player 2
        //paddle2.position = ccp(974, location.y);        
        paddle2.targetY = location.y;    
    }
}


-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {

		paddle1 = [[Paddle alloc] initForPlayer:1];            
        [self addChild:paddle1];   

		paddle2 = [[Paddle alloc] initForPlayer:2];            
        [self addChild:paddle2];           
        
        ball = [[Ball alloc] initWithLocation:ccp(100,500) andVelocity:ccp(300,100)]; // P1 ball
        [self addChild:ball];
        
        ball = [[Ball alloc] initWithLocation:ccp(900,500) andVelocity:ccp(-300,-100)]; // P2 ball
        [self addChild:ball];

        
        // Create blocks
        for (int row = 0; row <= 8; row++) {          
            for (int index = 0; index <= 9; index++) {
                Block *block = [[Block alloc] initWithRow:row atIndex:index];
                [self addChild:block];
            }
        }   
        [self schedule:@selector(nextFrame:)];
        
        self.isTouchEnabled = YES;
        

        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
