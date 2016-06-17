//
//  AppDelegate.h
//  SM-AnimateSplash
//
//  Created by Majharul Huq on 6/17/16.
//  Copyright © 2016 SmartMux. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AnimationBlock)();

@interface SplashScreenView : UIView

@property (nonatomic, assign) AnimationBlock animationCompletedBlock;
@property (nonatomic, assign) AnimationBlock animationStartBlock;

@end