//
//  Paddle.h
//  Ponkanoid
//
//  Created by Kevin Bruin on 5/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Paddle : CCSprite {
    
}

@property (nonatomic, readwrite) int player;
@property (nonatomic, readwrite) float velocity;
@property (nonatomic, readwrite) float targetY; // paddle should move here after touch


- (id) initForPlayer:(int)playerNo;
-(void)move:(ccTime)delta;


@end
