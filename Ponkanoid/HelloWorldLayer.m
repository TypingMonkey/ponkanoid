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


CCSprite *block1;
CCSprite *block2;


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
    block1.position = ccp(block1.position.x + 200*dt, block1.position.y);
    if (block1.position.x > 1024+35) {
        block1.position = ccp( 35, block1.position.y);
    }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	 
    CGPoint location = [self convertTouchToNodeSpace: touch];
	[block2 stopAllActions];
	[block2 runAction: [CCMoveTo actionWithDuration:1 position:location]];    
    
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
		block1 = [CCSprite spriteWithFile:@"block1.png"];
        block1.position = ccp(50, 100);
        [self addChild:block1];

		block2 = [CCSprite spriteWithFile:@"paddle.png"];
        block2.position = ccp(100, 200);
        [self addChild:block2];   
        
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
