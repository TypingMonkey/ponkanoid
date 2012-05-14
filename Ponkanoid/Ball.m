//
//  Ball.m
//  Ponkanoid
//
//  Created by Kevin Bruin on 5/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"
#import "Paddle.h"



@implementation Ball

@synthesize velocity;


-(id)initWithLocation:(CGPoint)location andVelocity:(CGPoint)_velocity {
    if (self = [super initWithFile:@"ball.png"])
    {
        self.position = location;
        self.velocity = _velocity;
    }
    return self;
}

-(float)radius{
    return self.texture.contentSize.width * .5;
}

-(void)move:(ccTime)delta {
    self.position = ccpAdd(self.position, ccpMult(velocity, delta));
    
    if (self.position.y < self.radius + marginY || self.position.y > 768-self.radius-marginY)
        velocity.y *= -1;
    
    if (self.position.x <self.radius)//player 1 score
        velocity.x *= -1;
    
    if (self.position.x > 1024+ self.radius)//player 2 score
        velocity.x *= -1;
        
}

-(BOOL)collideWithPaddle:(Paddle*)paddle {
    return [self collideWithRect:paddle ];
}

-(BOOL)collideWithBlock:(Block*)block {
    BOOL result = [self collideWithRect:block];
    if (result) [block destroy]; // block should destroy itself
    return result;
}


-(BOOL) collideWithRect:(CCNode*)node {
    if (CGRectIntersectsRect([self boundingBox], [node boundingBox]))
    {
        
        
        CGPoint otherOrigin = CGPointMake(CGRectGetMidX([node boundingBox]),CGRectGetMidY([node boundingBox]));
        
        CGPoint selfOrigin = CGPointMake(CGRectGetMidX(self.boundingBox), CGRectGetMidY(self.boundingBox));
        
        //self.position = ccpSub(self.position, self.velocity);
        
        CGPoint reflect = ccpSub(selfOrigin, otherOrigin);
        reflect.x *= 5;//to make the ball allways have a decent speed beteen the pedals
        
        reflect = ccpMult(ccpNormalize(reflect), ccpLength(self.velocity) * 1.02f);
        
        self.velocity = reflect;

        
        return YES; 
    }
    return NO;
}





@end
