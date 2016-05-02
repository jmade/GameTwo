//
//  JMMap.h
//  GameTwo
//
//  Created by Justin Madewell on 2/27/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface JMMap : SKNode
@property (nonatomic) CGSize gridSize;
@property (readonly) CGPoint spawnPoint;
@property (readonly) CGPoint exitPoint;
@property (readonly) CGPoint treasurePoint;
@property (nonatomic) NSUInteger maxFloorCount;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *transformedImage;

+ (instancetype) mapWithGridSize:(CGSize)gridSize;
- (instancetype) initWithGridSize:(CGSize)gridSize;

-(void)generate;

@end
