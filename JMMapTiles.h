//
//  JMMapTiles.h
//  GameTwo
//
//  Created by Justin Madewell on 2/27/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, MapTileType)
{
    
    MapTileTypeInvalid = -1,
    MapTileTypeNone = 0,
    MapTileTypeFloor = 2,
    MapTileTypeWall = 1,
    MapTileTypeDoor = 3,
    // Extend Additional Tiles Here
};

@interface JMMapTiles : NSObject

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) CGSize gridSize;

- (instancetype)initWithGridSize:(CGSize)size;
- (MapTileType)tileTypeAt:(CGPoint)tileCoordinate;
- (void)setTileType:(MapTileType)type at:(CGPoint)tileCoordinate;
- (BOOL)isEdgeTileAt:(CGPoint)tileCoordinate;
- (BOOL)isValidTileCoordinateAt:(CGPoint)tileCoordinate;



@end
