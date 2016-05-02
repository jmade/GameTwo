//
//  JMSkeleton.h
//  GameTwo
//
//  Created by Justin Madewell on 3/15/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
typedef enum skeletonState {
    
    skeletonStateWalkingRight = 0,
    skeletonStateWalkingLeft = 1,
    skeletonStateWalkingUp = 2,
    skeletonStateWalkingDown = 3,
    skeletonStateStandingRight = 4,
    skeletonStateStandingLeft = 5,
    skeletonStateStandingUp = 6,
    skeletonStateStandingDown = 7,
    skeletonStateExiting = 8,
    skeletonStateExperiment = 9,
    skeletonStateCastingRight = 10,
    skeletonStateCastingLeft = 11,
    skeletonStateCastingUp = 12,
    skeletonStateCastingDown = 13,
    skeletonStateSlashingRight = 14,
    skeletonStateSlashingLeft = 15,
    skeletonStateSlashingUp = 16,
    skeletonStateSlashingDown = 17,
    skeletonStateThrustingRight = 18,
    skeletonStateThrustingLeft = 19,
    skeletonStateThrustingUp = 20,
    skeletonStateThrustingDown = 21,
    skeletonStateBowRight = 22,
    skeletonStateBowLeft = 23,
    skeletonStateBowUp = 24,
    skeletonStateBowDown = 25,
    skeletonStateHurt = 26,
    
    
} skeletonState;


@interface JMSkeleton : SKSpriteNode

@property (strong, nonatomic) NSMutableArray *walkingRightFrames;
@property (strong, nonatomic) NSMutableArray *walkingLeftFrames;
@property (strong, nonatomic) NSMutableArray *walkingUpFrames;
@property (strong, nonatomic) NSMutableArray *walkingDownFrames;

@property (strong, nonatomic) NSMutableArray *castingRightFrames;
@property (strong, nonatomic) NSMutableArray *castingLeftFrames;
@property (strong, nonatomic) NSMutableArray *castingUpFrames;
@property (strong, nonatomic) NSMutableArray *castingDownFrames;

@property (strong, nonatomic) NSMutableArray *slashRightFrames;
@property (strong, nonatomic) NSMutableArray *slashLeftFrames;
@property (strong, nonatomic) NSMutableArray *slashUpFrames;
@property (strong, nonatomic) NSMutableArray *slashDownFrames;

@property (strong, nonatomic) NSMutableArray *bowRightFrames;
@property (strong, nonatomic) NSMutableArray *bowLeftFrames;
@property (strong, nonatomic) NSMutableArray *bowUpFrames;
@property (strong, nonatomic) NSMutableArray *bowDownFrames;

@property (strong, nonatomic) NSMutableArray *thrustRightFrames;
@property (strong, nonatomic) NSMutableArray *thrustLeftFrames;
@property (strong, nonatomic) NSMutableArray *thrustUpFrames;
@property (strong, nonatomic) NSMutableArray *thrustDownFrames;

@property (strong, nonatomic) NSMutableArray *hurtFrames;

@property (nonatomic, strong) SKTexture *standingRight;
@property (nonatomic, strong) SKTexture *standingLeft;
@property (nonatomic, strong) SKTexture *standingUp;
@property (nonatomic, strong) SKTexture *standingDown;

@property (nonatomic, strong) SKTexture *exitingLevel;

@property (nonatomic, strong) UIImage *spriteImage;
@property (nonatomic, strong) SKTexture *spriteSheet;
@property (strong, nonatomic) NSMutableArray *spritesArray;
@property (strong, nonatomic) NSMutableArray *spriteFrames;

@property (assign, nonatomic) int animationState;



@end
