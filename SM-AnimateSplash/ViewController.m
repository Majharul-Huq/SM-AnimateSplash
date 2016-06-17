//
//  ViewController.m
//  SM-AnimateSplash
//
//  Created by Majharul Huq on 6/17/16.
//  Copyright © 2016 SmartMux. All rights reserved.
//

#import "ViewController.h"
#import "SplashScreenView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SplashScreenView *splashScreenView = [[SplashScreenView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:splashScreenView];
    
    splashScreenView.animationStartBlock = ^void(){
        NSLog(@"Animation Started......");
    };
    splashScreenView.animationCompletedBlock = ^void(){
        NSLog(@"Animation Completed......");
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
