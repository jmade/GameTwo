//
//  JMCharacter.m
//  GameTwo
//
//  Created by Justin Madewell on 3/15/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import "JMCharacter.h"
#import "Random.h"

static NSString *characterName = @"character";
static NSTimeInterval speed = 0.15;

@implementation JMCharacter

-(instancetype)init
{
    self = [super initWithImageNamed:@"default"];
    {
        self.name = characterName;
        self.canHaveFace = NO;
        self.earsSwitch = NO;
        self.zPosition = 10;
        
        [self flick];
        
        [self chopTOSprite];
        [self startWalkingDownAnimation];
        
       // [self openSpriteDB];
        //[self setupNewAnimation];
       // [self randomSetAnimationDown];
        //[self startBowDownAnimation];
        
    }
    return self;
}

//-(instancetype) initSkeleton
//{
//    [self init];
//    return self;
//}

-(void)flick
{
    NSInteger switchNumber = [Random randomIntegerFrom:0 to:100];
    NSLog(@"Switch Number:%li",(long)switchNumber);
    if (switchNumber > 51) {
        self.isYes = YES;
    }
    else {
        self.isYes = NO;
    }
    
    NSLog(self.isYes ? @"Switch Value: Yes" : @"Switch Value: No");
}

-(void)randomSetAnimationDown
{
    NSInteger rInt = ([Random randomIntegerFrom:1 to:7]-1);
    if (rInt == 0){
        [self setAnimationState:3];
    }
    if (rInt == 1){
        [self setAnimationState:3];
    }
    if (rInt == 2){
        [self setAnimationState:13];
    }
    if (rInt == 3){
        [self setAnimationState:17];
    }
    if (rInt == 4){
        [self setAnimationState:21];
    }
    if (rInt == 5){
        [self setAnimationState:25];
    }
    if (rInt == 6){
        [self setAnimationState:26];
    }
    NSLog(@"rInt: %li",(long)rInt);
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
        case characterStateWalkingLeft:
            [self startWalkingLeftAnimation];
            break;
            // Right
        case characterStateWalkingRight:
            [self startWalkingRightAnimation];
            break;
            // Up
        case characterStateWalkingUp:
            [self startWalkingUpAnimation];
            break;
            // Down
        case characterStateWalkingDown:
            [self startWalkingDownAnimation];
            break;
            // Standing Left
        case characterStateStandingLeft:
            [self startStandingLeftAnimation];
            break;
            // Standing Right
        case characterStateStandingRight:
            [self startStandingRightAnimation];
            break;
            // Standing Up
        case characterStateStandingUp:
            [self startStandingUpAnimation];
            break;
            // Standing Down
        case characterStateStandingDown:
            [self startStandingDownAnimation];
            break;
            // Casting Down
        case characterStateCastingDown:
            [self startCastingDownAnimation];
            break;
            // Casting Left
        case characterStateCastingLeft:
            [self startCastingLeftAnimation];
            break;
            // Casting Right
        case characterStateCastingRight:
            [self startCastingRightAnimation];
            break;
            // Casting Up
        case characterStateCastingUp:
            [self startCastingUpAnimation];
            break;
            // Slashing Down
        case characterStateSlashingDown:
            [self startSlashingDownAnimation];
            break;
            // Slashing Up
        case characterStateSlashingUp:
            [self startSlashingUpAnimation];
            break;
            // Slashing Left
        case characterStateSlashingLeft:
            [self startSlashingLeftAnimation];
            break;
            // Slashing Right
        case characterStateSlashingRight:
            [self startSlashingRightAnimation];
            break;
            // Thrusting Left
        case characterStateThrustingLeft:
            [self startThrustingLeftAnimation];
            break;
            // Thrusting Right
        case characterStateThrustingRight:
            [self startThrustingRightAnimation];
            break;
            // Thrusting Up
        case characterStateThrustingUp:
            [self startThrustingUpAnimation];
            break;
            // Thrusting Down
        case characterStateThrustingDown:
            [self startThrustingDownAnimation];
            break;
            // Bow Up
        case characterStateBowUp:
            [self startBowUpAnimation];
            break;
            // Bow Down
        case characterStateBowDown:
            [self startBowDownAnimation];
            break;
            // Bow Left
        case characterStateBowLeft:
            [self startBowLeftAnimation];
            break;
            // Bow Right
        case characterStateBowRight:
            [self startBowRightAnimation];
            break;
            // Exiting Level
        case characterStateExiting:
            [self startExitingAnimation];
            break;
            // Hurt
        case characterStateHurt:
            [self startHurtingAnimation];
            break;
            // Experimental
        case characterStateExperiment:
            [self startExperimentalAnimation];
            break;
        default:
            break;
    }
    _animationState = animationState;
}
#pragma mark - Setup Animation

-(void)openSpriteDB
{
    if (self.isYes == YES){
        self.pathString = @"SpriteDBMale";
    }
    if (self.isYes == NO) {
        self.pathString = @"SpriteDBFemale";
    };
    
    NSLog(@"Path String: %@",self.pathString);
    
    NSString *characterData = [[NSString alloc] init];
    characterData = [[NSBundle mainBundle] pathForResource:self.pathString ofType:@"plist"];
    NSURL *characterDataUrl = [[NSURL alloc] initFileURLWithPath:characterData isDirectory:NO];
    NSDictionary *characterSpriteDict = [[NSDictionary alloc] initWithContentsOfURL:characterDataUrl];
    
    // Ears
    NSUInteger deciderInt = [Random randomIntegerFrom:0 to:100];
    if (deciderInt <= 50) {
        self.earsSwitch = YES;
    }
    if (self.earsSwitch == YES) {
        self.earsTypeString = @"eleven";
    }
    if (self.earsSwitch == NO) {
        self.earsTypeString = @"big";
    }
    NSLog(@"Ear Type: %@",self.earsTypeString);
    //
    
    
    NSUInteger noseTypeInteger = [Random randomIntegerFrom:1 to:3];
    NSLog(@"noseTypeInteger: %lu",(unsigned long)noseTypeInteger);
    
    NSUInteger bodyInteger = [Random randomIntegerFrom:1 to:9];
    if (bodyInteger <= 7) {
        self.canHaveFace = YES;
        NSLog(@"Can Have Face!");
    }
    NSLog(@"Body Integer: %lu",(unsigned long)bodyInteger);
    
    
    NSDictionary *bodyDictionary = [characterSpriteDict objectForKey:@"body"];
    NSDictionary *noseDictionary = [bodyDictionary objectForKey:@"nose"];
    NSDictionary *earsDictionary = [bodyDictionary objectForKey:@"ears"];
    NSArray *earsArray = [earsDictionary objectForKey:self.earsTypeString];
    
    NSArray *noseKeys = [noseDictionary allKeys];
    NSString *noseTypeString = [noseKeys objectAtIndex:(noseTypeInteger-1)];
    NSArray *noseTypeArray = [noseDictionary objectForKey:noseTypeString];
    
    
    
    NSArray *bodyArray = [bodyDictionary objectForKey:@"body"];
    NSArray *eyesArray = [bodyDictionary objectForKey:@"eyes"];
    
    
    NSDictionary *headDict = [characterSpriteDict objectForKey:@"head"];
    NSArray *headDictKeys = [headDict allKeys];
    NSUInteger headDictCount = [headDictKeys count];
    NSString *subHeadString = [headDictKeys objectAtIndex:[Random randomIntegerFrom:0 to:(headDictCount-1)]];
    NSArray *subHeadArray = [headDict objectForKey:subHeadString];
    NSUInteger subHeadCount = [subHeadArray count];
    NSLog(@"Sub Head Count Int: %lu",(unsigned long)subHeadCount);
    NSUInteger hasHat = [Random randomIntegerFrom:1 to:10];
    NSLog(@"HasHat Int: %lu",(unsigned long)hasHat);
    
    NSDictionary *torsoDictionary = [characterSpriteDict objectForKey:@"torso"];
    NSArray *torsoDictKeys = [torsoDictionary allKeys];
    NSUInteger torsoCount = [torsoDictKeys count];
    NSString *subTorsoString = [torsoDictKeys objectAtIndex:[Random randomIntegerFrom:0 to:(torsoCount-1)]];
    NSArray *subTorsoArray = [torsoDictionary objectForKey:subTorsoString];
    NSUInteger subTorsoCount = [subTorsoArray count];
    
    NSDictionary *legsDictionary = [characterSpriteDict objectForKey:@"legs"];
    NSArray *legsDictKeys = [legsDictionary allKeys];
    NSString *subLegString = [legsDictKeys objectAtIndex:[Random randomIntegerFrom:0 to:2]];
    NSArray *subLegArray = [legsDictionary objectForKey:subLegString];
    NSUInteger subLegCount = [subLegArray count];
    
    NSDictionary *feetDictionary = [characterSpriteDict objectForKey:@"feet"];
    NSArray *feetDictKeys = [feetDictionary allKeys];
    NSUInteger feetKeysCount = [feetDictKeys count];
    NSString *feetString = [feetDictKeys objectAtIndex:[Random randomIntegerFrom:0 to:(feetKeysCount-1)]];
    NSArray *subFeetArray = [feetDictionary objectForKey:feetString];
    NSUInteger subFeetCount = [subFeetArray count];
    
    NSDictionary *handsDictionary = [characterSpriteDict objectForKey:@"hands"];
    NSArray *handsDictKeys = [handsDictionary allKeys];
    NSString *handsString = [handsDictKeys objectAtIndex:[Random randomIntegerFrom:0 to:3]];
    NSArray *subHandArray = [handsDictionary objectForKey:handsString];
    NSUInteger subHandCount = [subHandArray count];
    
    NSDictionary *hairDictionary = [characterSpriteDict objectForKey:@"hair"];
    NSArray *hairDictKeys = [hairDictionary allKeys];
    NSUInteger hairKeysCount = [hairDictKeys count];
    NSString *hairString = [hairDictKeys objectAtIndex:[Random randomIntegerFrom:0 to:(hairKeysCount-1)]];
    NSArray *subHairArray = [hairDictionary objectForKey:hairString];
    NSUInteger subHairCount = [subHairArray count];
    
    NSDictionary *weaponDictionary = [characterSpriteDict objectForKey:@"weapons"];
    NSArray *rightHandArray = [weaponDictionary objectForKey:@"righthand"];
    NSUInteger rightHandInt = [rightHandArray count];
    NSUInteger bowTypeInt = [Random randomIntegerFrom:1 to:3];
    
    
    // Assign Strings
    self.bodyString = [bodyArray objectAtIndex:(bodyInteger-1)];
    self.eyesString = [eyesArray objectAtIndex:[Random randomIntegerFrom:0 to:7]];
    self.torsoString = [subTorsoArray objectAtIndex:[Random randomIntegerFrom:0 to:(subTorsoCount-1)]];
    self.legString = [subLegArray objectAtIndex:[Random randomIntegerFrom:0 to:(subLegCount-1)]];
    self.feetString = [subFeetArray objectAtIndex:[Random randomIntegerFrom:0 to:(subFeetCount-1)]];
    self.handsString = [subHandArray objectAtIndex:[Random randomIntegerFrom:0 to:(subHandCount-1)]];
    self.hairString = [subHairArray objectAtIndex:[Random randomIntegerFrom:0 to:(subHairCount-1)]];
    self.rightHand = [rightHandArray objectAtIndex:[Random randomIntegerFrom:0 to:(rightHandInt-1)]];
    
    NSMutableArray *spriteArray = [[NSMutableArray alloc]init];
    
    [spriteArray addObject:[UIImage imageNamed:self.bodyString]];
    
    if (self.canHaveFace == YES) {
        self.noseString = [noseTypeArray objectAtIndex:(bodyInteger-1)];
        NSLog(@"Nose String: %@",self.noseString);
        self.earsString = [earsArray objectAtIndex:(bodyInteger-1)];
        NSLog(@"Ears String: %@",self.earsString);
        [spriteArray addObject:[UIImage imageNamed:self.earsString]];
        [spriteArray addObject:[UIImage imageNamed:self.noseString]];
        [spriteArray addObject:[UIImage imageNamed:self.eyesString]];
        [spriteArray addObject:[UIImage imageNamed:self.hairString]];
    }
    
    
    
    if (hasHat < 4) {
        NSLog(@"Has Hat!");
        self.headString = [subHeadArray objectAtIndex:[Random randomIntegerFrom:0 to:(subHeadCount-1)]];
        [spriteArray addObject:[UIImage imageNamed:self.headString]];
    }

    [spriteArray addObject:[UIImage imageNamed:self.torsoString]];
    [spriteArray addObject:[UIImage imageNamed:self.legString]];
    [spriteArray addObject:[UIImage imageNamed:self.feetString]];
    [spriteArray addObject:[UIImage imageNamed:self.handsString]];
    [spriteArray addObject:[UIImage imageNamed:@"weapons_lefthand_arrow"]];
    [spriteArray addObject:[UIImage imageNamed:@"weapons_twohands_spear"]];
    
    
    
    if (bowTypeInt == 1) {
        [spriteArray addObject:[UIImage imageNamed:@"weapons_righthand_greatbow"]];
        NSLog(@"Bow Type: GreatBow");
    }
    if (bowTypeInt == 2) {
        [spriteArray addObject:[UIImage imageNamed:@"weapons_righthand_recurvebow"]];
        NSLog(@"Bow Type: RecurveBow");
    }
    if (bowTypeInt == 3) {
        [spriteArray addObject:[UIImage imageNamed:@"weapons_righthand_bow"]];
        NSLog(@"Bow Type: Bow");
    }
    
    [spriteArray addObject:[UIImage imageNamed:self.rightHand]];
    
    NSLog(@"Right Hand Weapon: %@",self.rightHand);

    
   
    
    
    [self makeSpritewithImages:spriteArray];
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    [self chopNewSprite:self.spriteSheet];

    
    
   
    
   
  
    
}

-(void)setupNewAnimation
{
    [self openSpriteDB];
    
    
    NSMutableArray *testArray = [[NSMutableArray alloc]init];
    [testArray addObject:[UIImage imageNamed:self.bodyString]];
    [testArray addObject:[UIImage imageNamed:self.eyesString]];
    [testArray addObject:[UIImage imageNamed:self.noseString]];
    [testArray addObject:[UIImage imageNamed:self.hairString]];
    [testArray addObject:[UIImage imageNamed:self.headString]];
    [testArray addObject:[UIImage imageNamed:self.torsoString]];
    [testArray addObject:[UIImage imageNamed:self.legString]];
    [testArray addObject:[UIImage imageNamed:self.feetString]];
    [testArray addObject:[UIImage imageNamed:self.handsString]];
    
    
    [self makeSpritewithImages:testArray];
    self.spriteSheet = [SKTexture textureWithImage:self.spriteImage];
    [self chopNewSprite:self.spriteSheet];
}

-(void)makeSpritewithImages:(NSArray*)imageArray
{
    UIImage *baseImage = [imageArray firstObject];
    CGRect imageRect = CGRectMake(0, 0, baseImage.size.width, baseImage.size.height);
    
    // Begin context
    UIGraphicsBeginImageContextWithOptions(baseImage.size, NO, 1.0);
    
    // draw images
    for (int i=0; i<[imageArray count]; i++) {
        [[imageArray objectAtIndex:i] drawInRect:imageRect];
    }
    // grab context
    self.spriteImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // end context
    UIGraphicsEndImageContext();
}



#pragma mark - Animation Setup

#pragma mark - TO Start

-(void)chopTOSprite
{
    CGSize size = CGSizeMake(34, 34);

    
    CGSize textureSize = CGSizeMake(134, 152);
    CGFloat fullWidth = textureSize.width;
    CGFloat fullHeight = textureSize.height;
    CGFloat startingX = 0;
    CGFloat startingY = 0;
    
    
    self.walkingRightFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *walkingRightAtlas = [SKTextureAtlas atlasNamed:@"right"];
    for (int i = 0; i < [walkingRightAtlas.textureNames count]; i++) {
        NSString *walkingRight = [NSString stringWithFormat:@"right%.3d", i];
        SKTexture *walkingRightTexture = [walkingRightAtlas textureNamed:walkingRight];
        if (walkingRightTexture) {
            [self.walkingRightFrames addObject:walkingRightTexture];
        }
    }
    //NSLog(@"Right Frames: %@",self.walkingRightFrames);
    
    self.walkingLeftFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *walkingLeftAtlas = [SKTextureAtlas atlasNamed:@"left"];
    for (int i = 0; i < [walkingLeftAtlas.textureNames count]; i++) {
        NSString *walkingLeft = [NSString stringWithFormat:@"left%.3d", i];
        SKTexture *walkingLeftTexture = [walkingLeftAtlas textureNamed:walkingLeft];
        if (walkingLeftTexture) {
            [self.walkingLeftFrames addObject:walkingLeftTexture];
        }
    }
    // NSLog(@"Left Frames: %@",self.walkingLeftFrames);
    
    self.walkingUpFrames = [[NSMutableArray alloc] init];
    SKTextureAtlas *walkingUpAtlas = [SKTextureAtlas atlasNamed:@"up"];
    for (int i = 0; i < [walkingUpAtlas.textureNames count]; i++) {
        NSString *walkingUp = [NSString stringWithFormat:@"up%.3d", i];
        SKTexture *walkingUpTexture = [walkingUpAtlas textureNamed:walkingUp];
        if (walkingUpTexture) {
            [self.walkingUpFrames addObject:walkingUpTexture];
        }
    }
    //NSLog(@"Up Frames: %@",self.walkingUpFrames);
    
    self.walkingDownFrames = [[NSMutableArray alloc]init];
    SKTextureAtlas *walkingDownAtlas = [SKTextureAtlas atlasNamed:@"down"];
    for (int i = 0; i < [walkingDownAtlas.textureNames count]; i++) {
        NSString *walkingDown = [NSString stringWithFormat:@"down%.3d",i];
        SKTexture *walkingDownTexture = [walkingDownAtlas textureNamed:walkingDown];
        if (walkingDownTexture) {
            [self.walkingDownFrames addObject:walkingDownTexture];
        }
    }
    // Set the Standing Animation Frames
    self.standingRight = [self.walkingRightFrames firstObject];
    self.standingLeft = [self.walkingLeftFrames firstObject];
    self.standingDown = [self.walkingDownFrames firstObject];
    self.standingUp = [self.walkingUpFrames firstObject];
    self.exitingLevel = [self.walkingDownFrames firstObject];

    
    //


    
    
}



#pragma mark -- New Sprite Sheet

-(void)chopNewSprite:(SKTexture *)fullTexture
{
    
    CGSize size = CGSizeMake(64, 64);
    
    
    
    CGFloat fullWidth = fullTexture.size.width;
    CGFloat fullHeight = fullTexture.size.height;
    CGFloat startingX = 0;
    
    NSLog(@"full Texture width: %f",fullWidth);
    NSLog(@"full Texture height: %f",fullHeight);
    
    // SPELLCAST
    int spellFrameCount = 7;
    self.castingUpFrames = [[NSMutableArray alloc]init];
    for (int i=0; i < spellFrameCount; i++){
        CGRect chopRect = CGRectMake(startingX/fullWidth, 1280/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:chopRect inTexture:fullTexture];
        [self.castingUpFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.castingLeftFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < spellFrameCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 1216/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.castingLeftFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.castingDownFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < spellFrameCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 1152/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.castingDownFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.castingRightFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < spellFrameCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 1088/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.castingRightFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    //
    // THRUST
    int thrustCount = 7;
    self.thrustUpFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < thrustCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 1024/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.thrustUpFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.thrustLeftFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < thrustCount; i++)
    {
        
        CGRect cutRect = CGRectMake(startingX/fullWidth, 960/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.thrustLeftFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.thrustDownFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < thrustCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 896/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.thrustDownFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.thrustRightFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < thrustCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 832/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.thrustRightFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    //
    // WALKING
    int walkCount = 9;
    self.walkingUpFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < walkCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 768/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.walkingUpFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.walkingLeftFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < walkCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 704/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.walkingLeftFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.walkingDownFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < walkCount; i++)
    {
       
        CGRect cutRect = CGRectMake(startingX/fullWidth, 640/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.walkingDownFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.walkingRightFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < walkCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 576/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.walkingRightFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    //
    // SLASHING
    int slashCount = 6;
    self.slashUpFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < slashCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 512/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.slashUpFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.slashRightFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < slashCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 448/fullHeight, size.width/fullWidth, size.height/fullHeight);
        
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.slashRightFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.slashDownFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < slashCount; i++)
    {
     
        CGRect cutRect = CGRectMake(startingX/fullWidth, 384/fullHeight, size.width/fullWidth, size.height/fullHeight);
        
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.slashDownFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.slashLeftFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < slashCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 320/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.slashLeftFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    //
    // BOW
    int bowCount = 13;
    self.bowUpFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < bowCount; i++)
    {
        
        CGRect cutRect = CGRectMake(startingX/fullWidth, 256/fullHeight, size.width/fullWidth, size.height/fullHeight);
        
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.bowUpFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.bowLeftFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < bowCount; i++)
    {
       
        CGRect cutRect = CGRectMake(startingX/fullWidth, 192/fullHeight, size.width/fullWidth, size.height/fullHeight);
        
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.bowLeftFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.bowDownFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < bowCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 128/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.bowDownFrames addObject:subTexture];
        startingX+=size.width;
    }
    //
    self.bowRightFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < bowCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 64/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.bowRightFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    //
    // HURT
    int hurtCount = 6;
    self.hurtFrames = [[NSMutableArray alloc]init];
    startingX = 0;
    for (int i=0; i < hurtCount; i++)
    {
        CGRect cutRect = CGRectMake(startingX/fullWidth, 0/fullHeight, size.width/fullWidth, size.height/fullHeight);
        SKTexture *subTexture = [SKTexture textureWithRect:cutRect inTexture:fullTexture];
        [self.hurtFrames addObject:subTexture];
        startingX+=size.width;
    }
    
    // Set the Standing Animation Frames
    self.standingRight = [self.walkingRightFrames firstObject];
    self.standingLeft = [self.walkingLeftFrames firstObject];
    self.standingDown = [self.walkingDownFrames firstObject];
    self.standingUp = [self.walkingUpFrames firstObject];
    self.exitingLevel = [self.walkingDownFrames firstObject];
}






@end
