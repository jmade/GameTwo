//
//  JMMyScene.m
//  GameTwo
//
//  Created by Justin Madewell on 2/27/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import "JMMyScene.h"
#import "GMPlayer.h"
#import "JMCharacter.h"
#import "JMSkeleton.h"
#import "JMMap.h"
#import "tgmath.h"
#import "JMDPad.h"
#import "Random.h"
@import AVFoundation;

// Degrees to radians
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

static const CGFloat kPlayerMovementSpeed = 120.0f/2;
static NSString *playerName = @"player";

@interface JMMyScene () <SKPhysicsContactDelegate>
@property (nonatomic) JMMap *map;
@property (nonatomic) JMDPad *jPad;
@property (nonatomic) JMCharacter *player;
@property (nonatomic) JMCharacter *character;
@property (nonatomic) JMSkeleton *skeleton;
@property (nonatomic) SKNode *world;
@property (nonatomic) SKSpriteNode *exit;
@property (nonatomic) SKSpriteNode *chest;
@property (nonatomic) SKTextureAtlas *spriteAtlas;
@property (nonatomic) SKNode *hud;
@property (nonatomic) NSMutableArray *characters;
@property (nonatomic) BOOL isExitingLevel;
@property (nonatomic) NSTimer *directionTimer;
@property (nonatomic) NSTimer *skeletonTimer;
@property (nonatomic) CGPoint characterVelocity;
@property (nonatomic) CGPoint skeletonVelocity;
@property (nonatomic) AVAudioPlayer* musicPlayer;
@property BOOL ranYet;
@property BOOL skeletonRanYet;
@property BOOL treasureOpened;


@end


@implementation JMMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.characters = [[NSMutableArray alloc]init];
        self.isExitingLevel = NO;
        self.characterVelocity = CGPointZero;
        self.ranYet = NO;
        self.skeletonRanYet = NO;
        self.treasureOpened = NO;
        
        self.backgroundColor = [SKColor lightGrayColor];//[SKColor colorWithRed:192.0f/255.0f green:152.0f/255.0f blue:73.0f/255.0f alpha:1.0f];
        
        // Load the atlas that contains the sprites
        self.spriteAtlas = [SKTextureAtlas atlasNamed:@"sprites"];

        // Add a node for the world - this is where sprites and tiles are added
        self.world = [SKNode node];
        
        // Create a new map
        NSUInteger gridInt = [Random randomIntegerFrom:8 to:14];
        self.map = [[JMMap alloc] initWithGridSize:CGSizeMake(gridInt,gridInt)];
        self.map.position = CGPointMake(self.world.frame.size.height/2, self.world.frame.size.width/2);
        
        [self.map generate];
        
        // Create the Treasure Chest
        self.chest = [SKSpriteNode spriteNodeWithTexture:[self.spriteAtlas textureNamed:@"chestClosed"]];
        self.chest.position = CGPointMake(100, 120);
        self.chest.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.chest.texture.size.width, self.chest.texture.size.height)];
        self.chest.physicsBody.categoryBitMask = CollisionTypeTreasure;
        self.chest.physicsBody.collisionBitMask = 0;
        //self.chest.zPosition = 9;
       

        // Create the exit
        self.exit = [SKSpriteNode spriteNodeWithTexture:[self.spriteAtlas textureNamed:@"exit"]];
        self.exit.position = self.map.exitPoint; //CGPointMake(self.map.position.x+32, self.map.position.y+64);
        self.exit.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(64, 32)];
        self.exit.physicsBody.categoryBitMask = CollisionTypeExit;
        self.exit.physicsBody.collisionBitMask = 0;

        // Create the Player
        self.player = [[JMCharacter alloc] init];
        CGFloat plHeight = self.player.texture.size.height;
        CGFloat plWidth = self.player.texture.size.width;
        CGPoint plSpawnPoint = CGPointMake(self.map.spawnPoint.x+128, self.map.spawnPoint.y+64);
        
        self.player.position = CGPointMake(plSpawnPoint.x-(plWidth/2), plSpawnPoint.y-(plHeight/4));
        self.player.physicsBody.allowsRotation = NO;
        self.player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.player.texture.size.width, self.player.texture.size.height/4)];
        self.player.physicsBody.categoryBitMask = CollisionTypePlayer;
        self.player.physicsBody.contactTestBitMask = CollisionTypeExit | CollisionTypeTreasure;
        self.player.physicsBody.collisionBitMask = CollisionTypeWall | CollisionTypeCharacter| CollisionTypeTreasure;
        
        // Create the NPC
        self.character = [[JMCharacter alloc]init];
        self.character.position = self.map.spawnPoint;
        self.character.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.character.texture.size.width,self.character.texture.size.height)];
        self.character.physicsBody.allowsRotation = NO;
        self.character.physicsBody.categoryBitMask = CollisionTypeCharacter;
        self.character.physicsBody.contactTestBitMask = CollisionTypePlayer | CollisionTypeTreasure;
        self.character.physicsBody.collisionBitMask = CollisionTypeWall | CollisionTypePlayer | CollisionTypeTreasure;
        
        // Create the Skeleton
        self.skeleton = [[JMSkeleton alloc]init];
        self.skeleton.position = CGPointMake(150, 230);
        self.skeleton.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(self.skeleton.texture.size.width, self.skeleton.texture.size.height)];
        self.skeleton.physicsBody.allowsRotation = NO;
        self.skeleton.physicsBody.categoryBitMask = CollisionTypeSkeleton;
        self.skeleton.physicsBody.contactTestBitMask =  CollisionTypePlayer;
        self.skeleton.physicsBody.collisionBitMask = CollisionTypeWall | CollisionTypePlayer | CollisionTypeTreasure;
        
        
        
        
       
        // Create a node for the HUD - this is where the DPad to control the player sprite will be added
        self.hud = [SKNode node];
        //self.hud.zPosition = 1;
        
        self.jPad = [[JMDPad alloc]initWithRect:CGRectMake(0, 0, 100.0f, 100.0f)];
        self.jPad.position = CGPointMake(10.0f, 10.0f);
        
        [self.hud addChild:self.jPad];
        
        [self.world addChild:self.player];
        [self.world addChild:self.character];
       // [self.world addChild:self.skeleton];
        [self.world addChild:self.map];
        [self.world addChild:self.exit];
        [self.world addChild:self.chest];
        
        [self addChild:self.world];
        [self addChild:self.hud];
        
        // Initialize physics
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
        
        self.directionTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(generateDirection) userInfo:nil repeats:YES];
         self.skeletonTimer = [NSTimer scheduledTimerWithTimeInterval:4.25 target:self selector:@selector(generateSkeletonDirection) userInfo:nil repeats:YES];
        [self.directionTimer fire];
        [self.skeletonTimer fire];
        [self setupMusic];

    }
    return self;
}

- (void) didMoveToView:(SKView *)view
{
    // This is where you could initialize Gesture recognizers
   

}


-(void)willMoveFromView:(SKView *)view
{
    // Remove any Add Gesture Recognizers
    for (UIGestureRecognizer *recognizer in view.gestureRecognizers) {
        [view removeGestureRecognizer:recognizer];
    }
    
    
    
}

- (void) setupMusic
{
    
    if (!self.musicPlayer) {
        [self.musicPlayer stop];
        NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"magical_theme" ofType:@"mp3"];
        self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:musicPath] error:NULL];
        self.musicPlayer.numberOfLoops = -1;
        self.musicPlayer.volume = 0.0;
        
        [self.musicPlayer prepareToPlay];
        [self.musicPlayer play];
        [self fadeVolume];

    }
    
   }


-(void)generateDirection
{
    if (!self.ranYet)
    {
        self.characterVelocity = CGPointZero;
        self.ranYet = YES;
    }
    else
    {
    NSInteger direction = [Random randomIntegerFrom:1 to:5];
    CGPoint newPosition;
    CGFloat moveSize = 64;
    // 4
    switch ( direction )
    {
        case 1: // Up
            newPosition = CGPointMake(-1*moveSize,0.5*moveSize);
            self.character.animationState = characterStateWalkingUp;
            break;
        case 2: // Down
            newPosition = CGPointMake(1*moveSize,-0.5*moveSize);
            self.character.animationState = characterStateWalkingDown;
            break;
        case 3: // Left
            newPosition = CGPointMake(-1*moveSize,-0.5*moveSize);
            self.character.animationState = characterStateWalkingLeft;
            break;
        case 4: // Right
            newPosition = CGPointMake(1*moveSize, 0.5*moveSize);
            self.character.animationState = characterStateWalkingRight;
            break;
        case 5:
            newPosition = CGPointZero;
            break;
    }
    self.characterVelocity = newPosition;
        SKAction *moveAction = [SKAction moveByX:newPosition.x/2 y:newPosition.y/2 duration:0.5];
        
        [self.character runAction:moveAction];
        
        
        //self.character.position = newPosition;
    NSLog(@"New Position: %@",NSStringFromCGPoint(self.characterVelocity));

    }
}

-(void)generateSkeletonDirection
{
    if (!self.skeletonRanYet)
    {
        self.skeletonVelocity = CGPointZero;
        self.skeletonRanYet = YES;
    }
    else
    {
        NSInteger direction = [Random randomIntegerFrom:1 to:5];
        CGPoint newPosition;
        // 4
        switch ( direction )
        {
            case 1: // Up
                newPosition = CGPointMake(-1,0.5);
                self.skeleton.animationState = skeletonStateWalkingUp;
                break;
            case 2: // Down
                newPosition = CGPointMake(1,-0.5);
                self.skeleton.animationState = skeletonStateWalkingDown;
                break;
            case 3: // Left
                newPosition = CGPointMake(-1,-0.5);
                self.skeleton.animationState = skeletonStateWalkingLeft;
                break;
            case 4: // Right
                newPosition = CGPointMake(1, 0.5);
                self.skeleton.animationState = skeletonStateWalkingRight;
                break;
            case 5:
                newPosition = CGPointZero;
                break;
        }
        self.skeletonVelocity = newPosition;
        NSLog(@"New Position: %@",NSStringFromCGPoint(self.skeletonVelocity));
        
    }
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    // Poll JPad
    CGPoint jPadVelocity = self.isExitingLevel ? CGPointZero : self.jPad.velocity;
    NSString *jPadDirection = self.jPad.direction;
    [self resolvePlayerOreintation:jPadDirection];
    
    // Update player sprite position and orientation based on JPad input
    self.player.position = CGPointMake(self.player.position.x + jPadVelocity.x * timeSinceLast * kPlayerMovementSpeed,
                                       self.player.position.y + jPadVelocity.y * timeSinceLast * kPlayerMovementSpeed);
    
    // Move "camera" so the player is in the middle of the screen
    self.world.position = CGPointMake((-self.player.position.x) + CGRectGetMidX(self.frame),
                                    (-self.player.position.y) + CGRectGetMidY(self.frame));
    
  //  CGPoint charVelocity = self.isExitingLevel ? CGPointZero : self.characterVelocity;
    CGPoint skeletonVelocity = self.isExitingLevel ? CGPointZero : self.skeletonVelocity;
    
    self.skeleton.position = CGPointMake(self.skeleton.position.x + skeletonVelocity.x * timeSinceLast * kPlayerMovementSpeed/3,
                                         self.skeleton.position.y + skeletonVelocity.y * timeSinceLast * kPlayerMovementSpeed/3);

    
    //self.character.position = CGPointMake(self.character.position.x + charVelocity.x * timeSinceLast * kPlayerMovementSpeed/8,self.character.position.y + charVelocity.y * timeSinceLast * kPlayerMovementSpeed/8);

    
    
   
}

- (void) didSimulatePhysics
{
    self.player.zRotation = 0.0f;
    self.character.zRotation = 0.0f;
    self.skeleton.zRotation = 0.0f;
}


-(void)resolvePlayerOreintation:(NSString *)direction
{
    if ([direction  isEqual: @"UP"]) {
        self.player.animationState = self.jPad.isActive ? playerStateWalkingUp : playerStateStandingUp;
    }
    if ([direction  isEqual: @"DOWN"]) {
        self.player.animationState = self.jPad.isActive ? playerStateWalkingDown : playerStateStandingDown;
    }
    if ([direction  isEqual: @"LEFT"]) {
        self.player.animationState = self.jPad.isActive ? playerStateWalkingLeft: playerStateStandingLeft;
    }
    if ([direction  isEqual: @"RIGHT"]) {
        self.player.animationState = self.jPad.isActive ? playerStateWalkingRight : playerStateStandingRight;
    }

}




- (void) resolveExit
{
    self.isExitingLevel = YES;
    
    
    
    [self.musicPlayer stop];
    [self fadeVolumeOut];
    
    [self.directionTimer invalidate];
    self.player.animationState = playerStateExiting;
    self.character.animationState = characterStateExiting;
    self.skeleton.animationState = skeletonStateExiting;
    self.musicPlayer.volume = 0.0;
    
    [self runAction:[SKAction playSoundFileNamed:@"downStairs.mp3" waitForCompletion:NO] completion:^{
        [self.view presentScene:[[JMMyScene alloc] initWithSize:self.size] transition:[SKTransition doorsCloseVerticalWithDuration:0.75f]];
    }];
}


-(void)characterHit
{
     NSLog(@"Charatcer Hit!");
}

- (void)fadeVolume
{
    NSLog(@"Volume: %f",self.musicPlayer.volume);
    if (self.musicPlayer.volume < 1.0)
    {
        self.musicPlayer.volume = self.musicPlayer.volume + 0.05;
        [self performSelector:@selector(fadeVolume) withObject:nil afterDelay:0.25];
    }
}

-(void)fadeVolumeOut
{
    
    NSLog(@"Volume: %f",self.musicPlayer.volume);
    if (self.musicPlayer.volume < 0.01)
    {
        self.musicPlayer.volume = self.musicPlayer.volume - 0.35;
        [self performSelector:@selector(fadeVolumeOut) withObject:nil afterDelay:0.25];
    }

}

-(void)resolveTreasure
{
    if (self.treasureOpened == NO)
    {
        NSLog(@"Treasure Chest Opened");
        self.treasureOpened = YES;
        SKAction *openSoundAction = [SKAction playSoundFileNamed:@"chestOpen.mp3" waitForCompletion:NO];
        [self runAction:openSoundAction];
        self.chest.texture = [self.spriteAtlas textureNamed:@"chestOpen"];
    }
}

-(void)playGoingDownStairsSound
{
    SKAction *downStairsSoundAction = [SKAction playSoundFileNamed:@"downStairs.mp3" waitForCompletion:NO];
    [self runAction:downStairsSoundAction];
   
}


- (void) didBeginContact:(SKPhysicsContact *)contact
{
    GMPlayer *player = nil;
    
    if (contact.bodyA.categoryBitMask == CollisionTypePlayer){
        player = (GMPlayer *) contact.bodyA.node;
        if (contact.bodyB.categoryBitMask == CollisionTypeExit){
            //[self playGoingDownStairsSound];
            
            [self resolveExit];
        }
        if (contact.bodyB.categoryBitMask == CollisionTypeCharacter){
            [self characterHit];
        }
        if (contact.bodyB.categoryBitMask == CollisionTypeTreasure) {
            [self resolveTreasure];
        }
        if (contact.bodyB.categoryBitMask == CollisionTypeSkeleton) {
            [self characterHit];
        }
    }
    
}


@end
