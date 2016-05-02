//
//  GMPlayer.h
//  GAME
//
//  Created by Justin Madewell on 2/23/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
typedef enum playerState {
    
    playerStateWalkingRight = 0,
    playerStateWalkingLeft = 1,
    playerStateWalkingUp = 2,
    playerStateWalkingDown = 3,
    playerStateStandingRight = 4,
    playerStateStandingLeft = 5,
    playerStateStandingUp = 6,
    playerStateStandingDown = 7,
    playerStateExiting = 8,
    
} playerState;


@interface GMPlayer : SKSpriteNode

@property (assign, nonatomic) BOOL selected;
@property (assign, nonatomic) BOOL accelerating;
@property (strong, nonatomic) NSMutableArray *walkingRightFrames;
@property (strong, nonatomic) NSMutableArray *jumpFrames;
@property (strong, nonatomic) NSMutableArray *walkingLeftFrames;
@property (strong, nonatomic) NSMutableArray *walkingUpFrames;
@property (strong, nonatomic) NSMutableArray *walkingDownFrames;
@property (nonatomic, strong) SKTexture *standingRight;
@property (nonatomic, strong) SKTexture *standingLeft;
@property (nonatomic, strong) SKTexture *standingUp;
@property (nonatomic, strong) SKTexture *standingDown;
@property (nonatomic, strong) SKTexture *exitingLevel;

@property (assign, nonatomic) int animationState;






@end
