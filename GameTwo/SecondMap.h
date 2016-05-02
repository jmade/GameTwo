//
//  SecondMap.h
//  GameTwo
//
//  Created by Justin Madewell on 3/13/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SecondMap : SKNode
@property (nonatomic) CGSize gridSize;
@property (readonly) CGPoint spawnPoint;
@property (readonly) CGPoint exitPoint;
@property (nonatomic) NSUInteger maxFloorCount;

+ (instancetype) mapWithGridSize:(CGSize)gridSize;
- (instancetype) initWithGridSize:(CGSize)gridSize;

-(void)generate;



@end
