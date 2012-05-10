//
//  ponkanoidAppDelegate.h
//  ponkanoid
//
//  Created by Paul Brinkkemper on 4/24/12.
//  Copyright ITu 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface ponkanoidAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
