//
//  Ball.h
//  Ponkanoid
//
//  Created by Kevin Bruin on 5/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Paddle.h"
#import "Block.h"

@interface Ball : CCSprite {
    
}

@property (nonatomic, readwrite) CGPoint velocity;

-(id)initWithLocation:(CGPoint)location andVelocity:(CGPoint)_velocity;
-(float)radius;
-(void)move:(ccTime)delta;
-(BOOL)collideWithPaddle:(Paddle*)paddle;
-(BOOL)collideWithBlock:(Block*)block;


@end
