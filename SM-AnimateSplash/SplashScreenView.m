//
//  AppDelegate.h
//  SM-AnimateSplash
//
//  Created by Majharul Huq on 6/17/16.
//  Copyright © 2016 SmartMux. All rights reserved.
//

#import "SplashScreenView.h"


@interface SplashScreenView()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SplashScreenView

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self == [super initWithFrame:frame]){
        self.backgroundColor = [UIColor redColor];
        UIImage *image = [UIImage imageNamed:[self getCurrentLaunchImageName]];
        [self updateLayout:image];
    }
    return self;
}

-(void)updateLayout:(UIImage*)image
{
    self.backgroundColor    = [UIColor colorWithPatternImage:image];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.image = image;
    self.imageView.alpha = 0;
    [self addSubview:self.imageView];
    
    [self startAnimation:(self.imageView.image == nil) ? 0 : 2];
}

-(void)startAnimation:(CGFloat)duration
{
    self.imageView.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:duration delay:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         self.imageView.transform = CGAffineTransformMakeScale(1.3,1.3);
         self.imageView.alpha = 1;
         if(_animationStartBlock){
             _animationStartBlock();
         }
     } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration + 0.5 animations:^{
            self.imageView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if(_animationCompletedBlock){
                _animationCompletedBlock();
            }
        }];
    }];
}

-(NSString *)getCurrentLaunchImageName
{
    NSString *currentImageName = nil;
    CGSize viewSize = self.bounds.size;
    NSArray *imageDicts = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary * dic in imageDicts) {
        CGSize imageSize = CGSizeFromString(dic[@"UILaunchImageSize"]);
        if(CGSizeEqualToSize(viewSize, imageSize)){
            currentImageName = dic[@"UILaunchImageName"];
        }
    }
    return currentImageName;
}

@end

