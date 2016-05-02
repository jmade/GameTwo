//
//  JMViewController.m
//  GameTwo
//
//  Created by Justin Madewell on 2/27/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import "JMViewController.h"
#import "JMMyScene.h"

@interface JMViewController ()
@property (nonatomic) BOOL didLayoutSubviews;
@end

@implementation JMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if ( !self.didLayoutSubviews )
    {

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [JMMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    }
    
    
    
    self.didLayoutSubviews = YES;
    
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
