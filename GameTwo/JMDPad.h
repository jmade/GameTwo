//
//  JMDPad.h
//  GameTwo
//
//  Created by Justin Madewell on 3/4/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface JMDPad : SKSpriteNode

//@property (nonatomic, strong) SKShapeNode *direction;
@property (nonatomic, strong) NSString *tappedDir;
@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, weak) UITouch *dirTouch;
@property (nonatomic, strong) NSString *direction;
@property (nonatomic, assign) BOOL isActive;


- (instancetype) initWithRect:(CGRect)rect;

@end
