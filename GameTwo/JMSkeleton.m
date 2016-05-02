//
//  JMSkeleton.m
//  GameTwo
//
//  Created by Justin Madewell on 3/15/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import "JMSkeleton.h"


static NSString *characterName = @"skeleton";
static NSTimeInterval speed = 0.12;


@implementation JMSkeleton

-(instancetype)init
{
    self = [super initWithImageNamed:@"default"];
    {
        self.name = characterName;
        self.zPosition = 10;
        [self openTextureDB];
        [self setupAnimations];
        [self startCastingDownAnimation];
        
        
    }
    return self;
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

- (void) startCastingRightAnimation
{
    if (![self actionForKey:@"castingRight"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.castingRightFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"castingRight"];
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

- (void) startCastingLeftAnimation
{
    if (![self actionForKey:@"castingLeft"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.castingLeftFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"castingLeft"];
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

- (void) startCastingUpAnimation
{
    if (![self actionForKey:@"castingUp"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.castingUpFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"castingUp"];
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

- (void) startCastingDownAnimation
{
    if (![self actionForKey:@"castingDown"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.castingDownFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"castingDown"];
    }
}


-(void)startExitingAnimation
{
    if (![self actionForKey:@"exitingLevel"]) {
        [self removeAllActions];
        [self runAction:[SKAction setTexture:self.exitingLevel] withKey:@"exitingLevel"];
    }
    
}


// Thrusting
- (void) startThrustingRightAnimation
{
    if (![self actionForKey:@"thrustingRight"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.thrustRightFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"thrustingRight"];
    }
}

- (void) startThrustingLeftAnimation
{
    if (![self actionForKey:@"thrustingLeft"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.thrustLeftFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"thrustingLeft"];
    }
}

- (void) startThrustingUpAnimation
{
    if (![self actionForKey:@"thrustingUp"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.thrustUpFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"thrustingUp"];
    }
}

- (void) startThrustingDownAnimation
{
    if (![self actionForKey:@"thrustingDown"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.thrustDownFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"thrustingDown"];
    }
}


// Bow

- (void) startBowRightAnimation
{
    if (![self actionForKey:@"bowRight"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.bowRightFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"bowRight"];
    }
}

- (void) startBowLeftAnimation
{
    if (![self actionForKey:@"bowLeft"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.bowLeftFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"bowLeft"];
    }
}

- (void) startBowUpAnimation
{
    if (![self actionForKey:@"bowUp"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.bowUpFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"bowUp"];
    }
}

- (void) startBowDownAnimation
{
    if (![self actionForKey:@"bowDown"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.bowDownFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"bowDown"];
    }
}

// Slashing

- (void) startSlashingRightAnimation
{
    if (![self actionForKey:@"slashingRight"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.slashRightFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"slashingRight"];
    }
}

- (void) startSlashingLeftAnimation
{
    if (![self actionForKey:@"slashingLeft"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.slashLeftFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"slashingLeft"];
    }
}

- (void) startSlashingUpAnimation
{
    if (![self actionForKey:@"slashingUp"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.slashUpFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"slashingUp"];
    }
}

- (void) startSlashingDownAnimation
{
    if (![self actionForKey:@"slashingDown"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.slashDownFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"slashingDown"];
    }
}

// Hurt

- (void) startHurtingAnimation
{
    if (![self actionForKey:@"hurtingAnimation"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.hurtFrames timePerFrame:speed resize:YES restore:NO]] withKey:@"hurtingAnimation"];
    }
}

// Experimental

-(void)startExperimentalAnimation
{
    if (![self actionForKey:@"expAnimation"]) {
        [self removeAllActions];
        [self runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:self.spritesArray  timePerFrame:0.15 resize:YES restore:NO]] withKey:@"expAnimation"];
    }
}



// Animation Switch

- (void) setAnimationState:(int)animationState
{
    switch (animationState) {
            // Left
        case skeletonStateWalkingLeft:
            [self startWalkingLeftAnimation];
            break;
            // Right
        case skeletonStateWalkingRight:
            [self startWalkingRightAnimation];
            break;
            // Up
        case skeletonStateWalkingUp:
            [self startWalkingUpAnimation];
            break;
            // Down
        case skeletonStateWalkingDown:
            [self startWalkingDownAnimation];
            break;
            // Standing Left
        case skeletonStateStandingLeft:
            [self startStandingLeftAnimation];
            break;
            // Standing Right
        case skeletonStateStandingRight:
            [self startStandingRightAnimation];
            break;
            // Standing Up
        case skeletonStateStandingUp:
            [self startStandingUpAnimation];
            break;
            // Standing Down
        case skeletonStateStandingDown:
            [self startStandingDownAnimation];
            break;
            // Casting Down
        case skeletonStateCastingDown:
            [self startCastingDownAnimation];
            break;
            // Casting Left
        case skeletonStateCastingLeft:
            [self startCastingLeftAnimation];
            break;
            // Casting Right
        case skeletonStateCastingRight:
            [self startCastingRightAnimation];
            break;
            // Casting Up
        case skeletonStateCastingUp:
            [self startCastingUpAnimation];
            break;
            // Slashing Down
        case skeletonStateSlashingDown:
            [self startSlashingDownAnimation];
            break;
            // Slashing Up
        case skeletonStateSlashingUp:
            [self startSlashingUpAnimation];
            break;
            // Slashing Left
        case skeletonStateSlashingLeft:
            [self startSlashingLeftAnimation];
            break;
            // Slashing Right
        case skeletonStateSlashingRight:
            [self startSlashingRightAnimation];
            break;
            // Thrusting Left
        case skeletonStateThrustingLeft:
            [self startThrustingLeftAnimation];
            break;
            // Thrusting Right
        case skeletonStateThrustingRight:
            [self startThrustingRightAnimation];
            break;
            // Thrusting Up
        case skeletonStateThrustingUp:
            [self startThrustingUpAnimation];
            break;
            // Thrusting Down
        case skeletonStateThrustingDown:
            [self startThrustingDownAnimation];
            break;
            // Bow Up
        case skeletonStateBowUp:
            [self startBowUpAnimation];
            break;
            // Bow Down
        case skeletonStateBowDown:
            [self startBowDownAnimation];
            break;
            // Bow Left
        case skeletonStateBowLeft:
            [self startBowLeftAnimation];
            break;
            // Bow Right
        case skeletonStateBowRight:
            [self startBowRightAnimation];
            break;
            // Exiting Level
        case skeletonStateExiting:
            [self startExitingAnimation];
            break;
        case skeletonStateExperiment:
            [self startExperimentalAnimation];
            break;
        default:
            break;
    }
    _animationState = animationState;
}

#pragma mark - Setup Animation

- (void) setupAnimations
{
    [self setupWalkingAnimations];
    [self setupStandingAnimations];
    [self setupCastingAnimations];
    [self setupSlashingAnimations];
    [self setupThrustingAnimations];
    [self setupHurtAnimations];
    [self setupBowAnimations];
}


#pragma mark - Animation Setup

-(void)setupWalkingAnimations
{
    NSMutableArray *walkingArray = [[NSMutableArray alloc]init];
    [walkingArray addObject:[UIImage imageNamed:@"walking_BODY_skeleton"]];
    [walkingArray addObject:[UIImage imageNamed:@"walking_HEAD_robe_hood"]];
    [walkingArray addObject:[UIImage imageNamed:@"walking_FEET_plate_armor_shoes"]];
    [walkingArray addObject:[UIImage imageNamed:@"walking_TORSO_plate_armor_arms_shoulders"]];
    
    [self makeSpritewithImages:walkingArray];
    
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    
    [self chopWalkingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:0];
    [self chopWalkingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:64];
    [self chopWalkingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:128];
    [self chopWalkingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:192];
}

-(void)setupSlashingAnimations
{
    NSMutableArray *slashingArray = [[NSMutableArray alloc]init];
    [slashingArray addObject:[UIImage imageNamed:@"slash_BODY_skeleton"]];
    [slashingArray addObject:[UIImage imageNamed:@"slash_HEAD_robe_hood"]];
    [slashingArray addObject:[UIImage imageNamed:@"slash_WEAPON_dagger"]];
    [slashingArray addObject:[UIImage imageNamed:@"slash_FEET_plate_armor_shoes"]];
    
    [self makeSpritewithImages:slashingArray];
    
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    
    [self chopSlashingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:0];
    [self chopSlashingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:64];
    [self chopSlashingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:128];
    [self chopSlashingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:192];
}

-(void)setupThrustingAnimations
{
    NSMutableArray *thrustingArray = [[NSMutableArray alloc]init];
    [thrustingArray addObject:[UIImage imageNamed:@"thrust_BODY_male"]];
    [thrustingArray addObject:[UIImage imageNamed:@"thrust_HEAD_plate_armor_helmet"]];
    [thrustingArray addObject:[UIImage imageNamed:@"thrust_FEET_shoes_brown"]];
    [thrustingArray addObject:[UIImage imageNamed:@"thrust_TORSO_leather_armor_shoulders"]];
    [thrustingArray addObject:[UIImage imageNamed:@"thrust_WEAPON_spear"]];
    [thrustingArray addObject:[UIImage imageNamed:@"thrust_WEAPON_staff"]];
    
    [self makeSpritewithImages:thrustingArray];
    
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    
    [self chopThrustingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:0];
    [self chopThrustingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:64];
    [self chopThrustingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:128];
    [self chopThrustingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:192];
}

-(void)setupBowAnimations
{
    NSMutableArray *bowArray = [[NSMutableArray alloc]init];
    [bowArray addObject:[UIImage imageNamed:@"bow_BODY_male"]];
    [bowArray addObject:[UIImage imageNamed:@"bow_LEGS_robe_skirt"]];
    [bowArray addObject:[UIImage imageNamed:@"bow_WEAPON_arrow"]];
    [bowArray addObject:[UIImage imageNamed:@"bow_WEAPON_bow"]];
    
    [self makeSpritewithImages:bowArray];
    
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    
    [self chopBowSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:0];
    [self chopBowSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:64];
    [self chopBowSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:128];
    [self chopBowSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:192];
}

-(void)setupCastingAnimations
{
    NSMutableArray *castingArray = [[NSMutableArray alloc]init];
    [castingArray addObject:[UIImage imageNamed:@"spellcast_BODY_skeleton"]];
    [castingArray addObject:[UIImage imageNamed:@"spellcast_FEET_plate_armor_shoes"]];
    [castingArray addObject:[UIImage imageNamed:@"spellcast_HEAD_skeleton_eye_glow"]];
    [castingArray addObject:[UIImage imageNamed:@"spellcast_HEAD_robe_hood"]];
    
    [self makeSpritewithImages:castingArray];
    
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    
    [self chopCastingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:0];
    [self chopCastingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:64];
    [self chopCastingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:128];
    [self chopCastingSprite:self.spriteSheet bySize:CGSizeMake(64, 64) startingY:192];
}

-(void)setupStandingAnimations
{
    self.standingRight = [self.walkingRightFrames firstObject];
    self.standingLeft = [self.walkingLeftFrames firstObject];
    self.standingDown = [self.walkingDownFrames firstObject];
    self.standingUp = [self.walkingUpFrames firstObject];
    self.exitingLevel = [self.walkingDownFrames firstObject];
}

-(void)setupHurtAnimations
{
    NSMutableArray *hurtArray = [[NSMutableArray alloc]init];
    [hurtArray addObject:[UIImage imageNamed:@"hurt_BODY_skeleton"]];
    [hurtArray addObject:[UIImage imageNamed:@"hurt_HEAD_robe_hood"]];
    [hurtArray addObject:[UIImage imageNamed:@"hurt_TORSO_leather_armor_bracers"]];
    
    [self makeSpritewithImages:hurtArray];
    
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    
    [self chopHurtSprite:self.spriteSheet bySize:CGSizeMake(64, 64)];
}

-(void)makeSpritewithImages:(NSArray*)imageArray
{
    UIImage *sampleImage = [imageArray objectAtIndex:0];
    CGRect imageRect = CGRectMake(0, 0, sampleImage.size.width, sampleImage.size.height);
    
    // Begin context
    UIGraphicsBeginImageContextWithOptions(sampleImage.size, NO, 1);
    
    // draw images
    for (int i=0; i<[imageArray count]; i++) {
        [[imageArray objectAtIndex:i] drawInRect:imageRect];
    }
    // grab context
    self.spriteImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // end context
    UIGraphicsEndImageContext();
}


-(void)chopWalkingSprite:(SKTexture *)fullTexture bySize:(CGSize)size startingY:(int)yPoint
{
    CGFloat fullWidth = fullTexture.size.width;
    CGFloat fullHeight = fullTexture.size.height;
    
    int gridX = fullWidth/size.width;
    int gridY = fullHeight/size.height;

    int startingX = 0;
    
    self.spriteFrames = [[NSMutableArray alloc]init];
    for (int i=0; i < gridX; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, yPoint/fullHeight, size.width/fullWidth, size.height/fullHeight);
      //  ////NSLog(@"Cut Rect:%@",NSStringFromCGRect(cutRect));
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:self.spriteSheet];
        [self.spriteFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    if (yPoint == 0) {
        // 0 RIGHT
        self.walkingRightFrames = self.spriteFrames;
        //////NSLog(@"Right Sprites: %@",self.walkingRightFrames);
    }
    if (yPoint == 64) {
        // 64 DOWN
        self.walkingDownFrames = self.spriteFrames;
        // ////NSLog(@"Down Sprites: %@",self.walkingDownFrames);
    }
    if (yPoint == 128) {
        // 128 LEFT
        self.walkingLeftFrames =  self.spriteFrames;
        //////NSLog(@"Left Sprites: %@",self.walkingLeftFrames);
    }
    if (yPoint == 192) {
        // 192 UP
        self.walkingUpFrames = self.spriteFrames;
       // ////NSLog(@"Up Sprites: %@",self.walkingUpFrames);
    }

//    ////NSLog(@"Full Text W:%f",fullWidth);
//    ////NSLog(@"Full Text H:%f",fullHeight);
//    
//    ////NSLog(@"GridX:%i",gridX);
//    ////NSLog(@"GridY:%i",gridY);
}

-(void)chopCastingSprite:(SKTexture *)fullTexture bySize:(CGSize)size startingY:(int)yPoint
{
    CGFloat fullWidth = fullTexture.size.width;
    CGFloat fullHeight = fullTexture.size.height;
    
    int gridX = fullWidth/size.width;
    int gridY = fullHeight/size.height;
    
    int startingX = 0;
    
    self.spriteFrames = [[NSMutableArray alloc]init];
    for (int i=0; i < gridX; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, yPoint/fullHeight, size.width/fullWidth, size.height/fullHeight);
      //  ////NSLog(@"Cut Rect:%@",NSStringFromCGRect(cutRect));
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:self.spriteSheet];
        [self.spriteFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    if (yPoint == 0) {
        // 0 RIGHT
        self.castingRightFrames = self.spriteFrames;
     //   ////NSLog(@"Right Sprites: %@",self.castingRightFrames);
    }
    if (yPoint == 64) {
        // 64 DOWN
        self.castingDownFrames = self.spriteFrames;
     //   ////NSLog(@"Down Sprites: %@",self.castingDownFrames);
    }
    if (yPoint == 128) {
        // 128 LEFT
        self.castingLeftFrames =  self.spriteFrames;
    //    ////NSLog(@"Left Sprites: %@",self.castingLeftFrames);
    }
    if (yPoint == 192) {
        // 192 UP
        self.castingUpFrames = self.spriteFrames;
     //   ////NSLog(@"Up Sprites: %@",self.castingUpFrames);
    }
    
//    ////NSLog(@"Full Text W:%f",fullWidth);
//    ////NSLog(@"Full Text H:%f",fullHeight);
//    
//    ////NSLog(@"GridX:%i",gridX);
//    ////NSLog(@"GridY:%i",gridY);
}

-(void)chopSlashingSprite:(SKTexture *)fullTexture bySize:(CGSize)size startingY:(int)yPoint
{
    CGFloat fullWidth = fullTexture.size.width;
    CGFloat fullHeight = fullTexture.size.height;
    
    int gridX = fullWidth/size.width;
    int gridY = fullHeight/size.height;
    
    int startingX = 0;
    
    self.spriteFrames = [[NSMutableArray alloc]init];
    for (int i=0; i < gridX; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, yPoint/fullHeight, size.width/fullWidth, size.height/fullHeight);
        //////NSLog(@"Cut Rect:%@",NSStringFromCGRect(cutRect));
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:self.spriteSheet];
        [self.spriteFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    if (yPoint == 0) {
        // 0 RIGHT
        self.slashRightFrames = self.spriteFrames;
        //////NSLog(@"Right Sprites: %@",self.slashRightFrames);
    }
    if (yPoint == 64) {
        // 64 DOWN
        self.slashDownFrames = self.spriteFrames;
      //  ////NSLog(@"Down Sprites: %@",self.slashDownFrames);
    }
    if (yPoint == 128) {
        // 128 LEFT
        self.slashLeftFrames =  self.spriteFrames;
      //  ////NSLog(@"Left Sprites: %@",self.slashLeftFrames);
    }
    if (yPoint == 192) {
        // 192 UP
        self.slashUpFrames = self.spriteFrames;
      //  ////NSLog(@"Up Sprites: %@",self.slashUpFrames);
    }
    
//    ////NSLog(@"Full Text W:%f",fullWidth);
//    ////NSLog(@"Full Text H:%f",fullHeight);
//    
//    ////NSLog(@"GridX:%i",gridX);
//    ////NSLog(@"GridY:%i",gridY);
}

-(void)chopThrustingSprite:(SKTexture *)fullTexture bySize:(CGSize)size startingY:(int)yPoint
{
    CGFloat fullWidth = fullTexture.size.width;
    CGFloat fullHeight = fullTexture.size.height;
    
    int gridX = fullWidth/size.width;
    int gridY = fullHeight/size.height;
    
    int startingX = 0;
    
    self.spriteFrames = [[NSMutableArray alloc]init];
    for (int i=0; i < gridX; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, yPoint/fullHeight, size.width/fullWidth, size.height/fullHeight);
        //////NSLog(@"Cut Rect:%@",NSStringFromCGRect(cutRect));
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:self.spriteSheet];
        [self.spriteFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    if (yPoint == 0) {
        // 0 RIGHT
        self.thrustRightFrames = self.spriteFrames;
        //////NSLog(@"Right Sprites: %@",self.thrustRightFrames);
    }
    if (yPoint == 64) {
        // 64 DOWN
        self.thrustDownFrames = self.spriteFrames;
       // ////NSLog(@"Down Sprites: %@",self.thrustDownFrames);
    }
    if (yPoint == 128) {
        // 128 LEFT
        self.thrustLeftFrames =  self.spriteFrames;
       // ////NSLog(@"Left Sprites: %@",self.thrustLeftFrames);
    }
    if (yPoint == 192) {
        // 192 UP
        self.thrustUpFrames = self.spriteFrames;
       // ////NSLog(@"Up Sprites: %@",self.thrustUpFrames);
    }
    
//    ////NSLog(@"Full Text W:%f",fullWidth);
//    ////NSLog(@"Full Text H:%f",fullHeight);
//    
//    ////NSLog(@"GridX:%i",gridX);
//    ////NSLog(@"GridY:%i",gridY);
}

-(void)chopBowSprite:(SKTexture *)fullTexture bySize:(CGSize)size startingY:(int)yPoint
{
    CGFloat fullWidth = fullTexture.size.width;
    CGFloat fullHeight = fullTexture.size.height;
    
    int gridX = fullWidth/size.width;
    int gridY = fullHeight/size.height;
    
    int startingX = 0;
    
    self.spriteFrames = [[NSMutableArray alloc]init];
    for (int i=0; i < gridX; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, yPoint/fullHeight, size.width/fullWidth, size.height/fullHeight);
        //////NSLog(@"Cut Rect:%@",NSStringFromCGRect(cutRect));
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:self.spriteSheet];
        [self.spriteFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    if (yPoint == 0) {
        // 0 RIGHT
        self.bowRightFrames = self.spriteFrames;
        //////NSLog(@"Right Sprites: %@",self.bowRightFrames);
    }
    if (yPoint == 64) {
        // 64 DOWN
        self.bowDownFrames = self.spriteFrames;
       // ////NSLog(@"Down Sprites: %@",self.bowDownFrames);
    }
    if (yPoint == 128) {
        // 128 LEFT
        self.bowLeftFrames =  self.spriteFrames;
        //////NSLog(@"Left Sprites: %@",self.bowLeftFrames);
    }
    if (yPoint == 192) {
        // 192 UP
        self.bowUpFrames = self.spriteFrames;
       // ////NSLog(@"Up Sprites: %@",self.bowUpFrames);
    }
    
//    ////NSLog(@"Full Text W:%f",fullWidth);
//    ////NSLog(@"Full Text H:%f",fullHeight);
//    
//    ////NSLog(@"GridX:%i",gridX);
//    ////NSLog(@"GridY:%i",gridY);
}

-(void)chopHurtSprite:(SKTexture *)fullTexture bySize:(CGSize)size
{
    CGFloat fullWidth = fullTexture.size.width;
    CGFloat fullHeight = fullTexture.size.height;
    
    int gridX = fullWidth/size.width;
    int gridY = fullHeight/size.height;
    
    int startingX = 0;
    
    self.spriteFrames = [[NSMutableArray alloc]init];
    for (int i=0; i < gridX; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 0/fullHeight, size.width/fullWidth, size.height/fullHeight);
        //////NSLog(@"Cut Rect:%@",NSStringFromCGRect(cutRect));
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:self.spriteSheet];
        [self.spriteFrames addObject:subTexture];
        startingX+=size.width;
    }
    
 
    self.hurtFrames = self.spriteFrames;
        
//    ////NSLog(@"Full Text W:%f",fullWidth);
//    ////NSLog(@"Full Text H:%f",fullHeight);
//    
//    ////NSLog(@"GridX:%i",gridX);
//    ////NSLog(@"GridY:%i",gridY);
}

#pragma mark -- PLIST 

-(void)openTextureDB
{

NSString *textureData = [[NSString alloc] init];
textureData = [[NSBundle mainBundle] pathForResource:@"TextureDB" ofType:@"plist"];
NSURL *textureDataUrl = [[NSURL alloc] initFileURLWithPath:textureData isDirectory:NO];
NSDictionary *textureDict = [[NSDictionary alloc] initWithContentsOfURL:textureDataUrl];
NSArray *textureKeys = [textureDict allKeys];
    
    NSDictionary *castingDictionary = [textureDict objectForKey:@"item 0"];
    ////NSLog(@"Casting Dict: %@",castingDictionary);


}



@end
