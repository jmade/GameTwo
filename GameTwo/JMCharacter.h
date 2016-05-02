//
//  JMCharacter.h
//  GameTwo
//
//  Created by Justin Madewell on 3/15/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
typedef enum characterState {
    
    characterStateWalkingRight = 0,
    characterStateWalkingLeft = 1,
    characterStateWalkingUp = 2,
    characterStateWalkingDown = 3,
    characterStateStandingRight = 4,
    characterStateStandingLeft = 5,
    characterStateStandingUp = 6,
    characterStateStandingDown = 7,
    characterStateExiting = 8,
    characterStateExperiment = 9,
    characterStateCastingRight = 10,
    characterStateCastingLeft = 11,
    characterStateCastingUp = 12,
    characterStateCastingDown = 13,
    characterStateSlashingRight = 14,
    characterStateSlashingLeft = 15,
    characterStateSlashingUp = 16,
    characterStateSlashingDown = 17,
    characterStateThrustingRight = 18,
    characterStateThrustingLeft = 19,
    characterStateThrustingUp = 20,
    characterStateThrustingDown = 21,
    characterStateBowRight = 22,
    characterStateBowLeft = 23,
    characterStateBowUp = 24,
    characterStateBowDown = 25,
    characterStateHurt = 26,
    
    
} characterState;


@interface JMCharacter : SKSpriteNode

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

@property BOOL isYes;
@property BOOL canHaveFace;
@property BOOL earsSwitch;
@property (nonatomic, strong) NSString *earsTypeString;

@property (nonatomic, strong) NSString *pathString;

@property (nonatomic, strong) NSDictionary *spellcastDict;
@property (nonatomic, strong) NSDictionary *walkingDict;
@property (nonatomic, strong) NSDictionary *bowDict;
@property (nonatomic, strong) NSDictionary *thrustDict;
@property (nonatomic, strong) NSDictionary *slashDict;
@property (nonatomic, strong) NSDictionary *hurtDict;

@property (nonatomic, strong) NSString *headString;
@property (nonatomic, strong) NSString *behindString;
@property (nonatomic, strong) NSString *beltString;
@property (nonatomic, strong) NSString *bodyString;
@property (nonatomic, strong) NSString *feetString;
@property (nonatomic, strong) NSString *handsString;
@property (nonatomic, strong) NSString *legString;
@property (nonatomic, strong) NSString *torsoString;
@property (nonatomic, strong) NSString *weaponString;
@property (nonatomic, strong) NSString *hairString;
@property (nonatomic, strong) NSString *eyesString;
@property (nonatomic, strong) NSString *noseString;
@property (nonatomic, strong) NSString *rightHand;
@property (nonatomic, strong) NSString *earsString;

+ (instancetype) initSkeleton;


@end
