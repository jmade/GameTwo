//
//  GMPlayer.m
//  GAME
//
//  Created by Justin Madewell on 2/23/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import "GMPlayer.h"
static NSString *playerName = @"player";
static NSTimeInterval speed = 0.10;


@implementation GMPlayer

-(instancetype)init
{
    self = [super initWithImageNamed:@"character.png"];
    {
        self.name = playerName;
        self.zPosition = 10;
        [self setupAnimations];
        [self startWalkingDownAnimation];
    }
    return self;
}

- (void) setAnimationState:(int)animationState
{
    switch (animationState) {
        // Left
        case playerStateWalkingLeft:
            [self startWalkingLeftAnimation];
        break;
        // Right
        case playerStateWalkingRight:
            [self startWalkingRightAnimation];
        break;
        // Up
        case playerStateWalkingUp:
            [self startWalkingUpAnimation];
        break;
        // Down
        case playerStateWalkingDown:
            [self startWalkingDownAnimation];
        break;
        // Standing Left
        case playerStateStandingLeft:
            [self startStandingLeftAnimation];
        break;
        // Standing Right
        case playerStateStandingRight:
            [self startStandingRightAnimation];
        break;
        // Standing Up
        case playerStateStandingUp:
            [self startStandingUpAnimation];
        break;
        // Standing Down
        case playerStateStandingDown:
            [self startStandingDownAnimation];
        break;
        // Exiting Level
        case playerStateExiting:
            [self startExitingAnimation];
        break;
        default:
        break;
    }
    _animationState = animationState;
}




#pragma mark - Animation Controls
// Right
-(void)startStandingRightAnimation
{
    if (![self actionForKey:@"standingRight"]) {
        [self removeAllActions];
        [self runAction:[SKAction setTexture:self.standingRight] withKey:@"standingRight"];
    }
}
- (void) startWalkingRightAnimation
{
    if (![self actionForKey:@"walkingRight"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.walkingRightFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"walkingRight"];
    }
}
// Left
-(void)startStandingLeftAnimation
{
    if (![self actionForKey:@"standingLeft"]) {
        [self removeAllActions];
        [self runAction:[SKAction setTexture:self.standingLeft] withKey:@"standingLeft"];
    }
}
- (void) startWalkingLeftAnimation
{
    if (![self actionForKey:@"walkingLeft"]) {
        [self removeAllActions];
         [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.walkingLeftFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"walkingLeft"];
    }
}
// Up
-(void)startStandingUpAnimation
{
    if (![self actionForKey:@"standingUp"]) {
        [self removeAllActions];
        [self runAction:[SKAction setTexture:self.standingUp] withKey:@"standingUp"];
    }

}
- (void) startWalkingUpAnimation
{
    if (![self actionForKey:@"walkingUp"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.walkingUpFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"walkingUp"];
    }
}
// Down
-(void)startStandingDownAnimation
{
    if (![self actionForKey:@"standingDown"]) {
        [self removeAllActions];
        [self runAction:[SKAction setTexture:self.standingDown] withKey:@"standingDown"];
    }

}
- (void) startWalkingDownAnimation
{
    if (![self actionForKey:@"walkingDown"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.walkingDownFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"walkingDown"];
    }
}

-(void)startExitingAnimation
{
    if (![self actionForKey:@"exitingLevel"]) {
        [self removeAllActions];
        [self runAction:[SKAction setTexture:self.exitingLevel] withKey:@"exitingLevel"];
    }

}


#pragma mark - Setup Animation
- (void) setupAnimations
{
    SKTextureAtlas *standingAtlas = [SKTextureAtlas atlasNamed:@"standing"];
    self.standingRight = [standingAtlas textureNamed:@"standingRight"];
    self.standingLeft = [standingAtlas textureNamed:@"standingLeft"];
    self.standingDown = [standingAtlas textureNamed:@"standingDown"];
    self.standingUp = [standingAtlas textureNamed:@"standingUp"];
    self.exitingLevel = [standingAtlas textureNamed:@"standingDown"];
    
    
    self.walkingRightFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *walkingRightAtlas = [SKTextureAtlas atlasNamed:@"walkingRight"];
    for (int i = 0; i < [walkingRightAtlas.textureNames count]; i++) {
        NSString *walkingRight = [NSString stringWithFormat:@"walkingRight%.3d", i];
        SKTexture *walkingRightTexture = [walkingRightAtlas textureNamed:walkingRight];
        if (walkingRightTexture) {
            [self.walkingRightFrames addObject:walkingRightTexture];
        }
    }
    //NSLog(@"Right Frames: %@",self.walkingRightFrames);
    
    self.walkingLeftFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *walkingLeftAtlas = [SKTextureAtlas atlasNamed:@"walkingLeft"];
    for (int i = 0; i < [walkingLeftAtlas.textureNames count]; i++) {
        NSString *walkingLeft = [NSString stringWithFormat:@"walkingLeft%.3d", i];
        SKTexture *walkingLeftTexture = [walkingLeftAtlas textureNamed:walkingLeft];
        if (walkingLeftTexture) {
            [self.walkingLeftFrames addObject:walkingLeftTexture];
        }
    }
   // NSLog(@"Left Frames: %@",self.walkingLeftFrames);
    
    self.walkingUpFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *walkingUpAtlas = [SKTextureAtlas atlasNamed:@"walkingUp"];
    for (int i = 0; i < [walkingUpAtlas.textureNames count]; i++) {
        NSString *walkingUp = [NSString stringWithFormat:@"walkingUp%.3d", i];
        SKTexture *walkingUpTexture = [walkingUpAtlas textureNamed:walkingUp];
        if (walkingUpTexture) {
            [self.walkingUpFrames addObject:walkingUpTexture];
        }
    }
    //NSLog(@"Up Frames: %@",self.walkingUpFrames);
    
    self.walkingDownFrames = [[NSMutableArray alloc]init];
    SKTextureAtlas *walkingDownAtlas = [SKTextureAtlas atlasNamed:@"walkingDown"];
    for (int i = 0; i < [walkingDownAtlas.textureNames count]; i++) {
        NSString *walkingDown = [NSString stringWithFormat:@"walkingDown%.3d",i];
        SKTexture *walkingDownTexture = [walkingDownAtlas textureNamed:walkingDown];
        if (walkingDownTexture) {
            [self.walkingDownFrames addObject:walkingDownTexture];
        }
    }
    //NSLog(@"Down Frames: %@",self.walkingDownFrames);
    
}


@end
