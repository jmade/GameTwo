//
//  JMMyScene.h
//  GameTwo
//
//
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(uint32_t, CollisionType)
{
    CollisionTypePlayer     = 0x1 << 0,
    CollisionTypeWall       = 0x1 << 1,
    CollisionTypeExit       = 0x1 << 2,
    CollisionTypeStairs     = 0x1 << 3,
    CollisionTypeCharacter  = 0x1 << 4,
    CollisionTypeTreasure   = 0x1 << 5,
    CollisionTypeSkeleton   = 0x1 << 6
};



@interface JMMyScene : SKScene

@property (assign) CFTimeInterval lastUpdateTimeInterval;

@end
