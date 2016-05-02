//
//  JMMap.m
//  GameTwo
//
//  Created by Justin Madewell on 2/27/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import "JMMap.h"
#import "JMMapTiles.h"
#import "Random.h"
#import "JMMyScene.h"

@interface JMMap ()
@property (nonatomic) SKTextureAtlas *tileAtlas;
@property (nonatomic) CGFloat tileSize;
@property (nonatomic) JMMapTiles *tiles;

@end

@implementation JMMap


+ (instancetype) mapWithGridSize:(CGSize)gridSize
{
    return [[self alloc] initWithGridSize:gridSize];
}

- (instancetype)initWithGridSize:(CGSize)gridSize
{
    if ((self = [super init]))
    {
        self.gridSize = gridSize;
        _spawnPoint = CGPointZero;
        _exitPoint = CGPointZero;
        
        self.tileAtlas = [SKTextureAtlas atlasNamed:@"tiles"];
        
        //
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
        
        CATransform3D currentTransform = CATransform3DIdentity;
        CATransform3D transform3DScale = CATransform3DScale(currentTransform, 1.0, 0.5, 0.5);
        //rotate layerView1 by 45 degrees along the Y axis
        CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        self.imageView.layer.transform = CATransform3DConcat(transform1, transform3DScale);
        self.transformedImage = self.imageView.image;
        SKTexture *skewedTexture = [SKTexture textureWithImage:self.transformedImage];
        
        //
        
        NSArray *textureNames = [self.tileAtlas textureNames];
        //SKTexture *tileTexture = [self.tileAtlas textureNamed:(NSString *)[textureNames firstObject]];
        self.tileSize = 64;

        [self generateTileGrid];
    }
    return self;
}

-(void)generate
{
    self.tiles = [[JMMapTiles alloc] initWithGridSize:self.gridSize];
    //[self generateTileGrid];
    [self generateNewTileGrid];
    [self generateTiles];
    [self generateCollisionWalls];
}

-(void)generateNewTileGrid
{
    for ( NSInteger y = 0; y < self.tiles.gridSize.height; y++ )
    {
        for ( NSInteger x = 0; x < self.tiles.gridSize.width; x++ )
        {
            CGPoint tileCoordinate = CGPointMake(x, y);
            
            // Check and set the TileType
            if ([self.tiles isValidTileCoordinateAt:tileCoordinate] && [self.tiles isEdgeTileAt:tileCoordinate])
            {
                [self.tiles setTileType:MapTileTypeWall at:tileCoordinate];
            }

            
            if([self.tiles isValidTileCoordinateAt:tileCoordinate] &&
               ![self.tiles isEdgeTileAt:tileCoordinate] &&
               [self.tiles tileTypeAt:tileCoordinate] == MapTileTypeNone)
            {
                [self.tiles setTileType:MapTileTypeFloor at:tileCoordinate];
            }

        }
    }
    CGPoint doorPoint = CGPointMake(self.tiles.gridSize.width-1, 4);
    [self.tiles setTileType:MapTileTypeFloor at:doorPoint];
    CGPoint doorPoint2 = CGPointMake(self.tiles.gridSize.width-1, 5);
    [self.tiles setTileType:MapTileTypeFloor at:doorPoint2];
    
    
    CGPoint theExitPoint = CGPointMake(3,(self.tiles.gridSize.height-2));
    _exitPoint = [self convertMapCoordinateToWorldCoordinate:theExitPoint];
    // 7
    NSLog(@"%@", [self.tiles description]);
    
    CGPoint theSpawnPoint = CGPointMake(2,(self.tiles.gridSize.height-3));
    _spawnPoint = [self convertMapCoordinateToWorldCoordinate:theSpawnPoint];
}


-(void)generateTileGrid
{
    
    CGPoint startPoint = CGPointMake(self.tiles.gridSize.width / 2, self.tiles.gridSize.height / 2);
    // 1
    [self.tiles setTileType:MapTileTypeFloor at:startPoint];
    NSUInteger currentFloorCount = 1;
    // 2
    CGPoint currentPosition = startPoint;
    while ( currentFloorCount < self.maxFloorCount )
    {
        // 3
        NSInteger direction = [Random randomIntegerFrom:1 to:4];
        CGPoint newPosition;
        // 4
        switch ( direction )
        {
            case 1: // Up
                newPosition = CGPointMake(currentPosition.x, currentPosition.y - 1);
                break;
            case 2: // Down
                newPosition = CGPointMake(currentPosition.x, currentPosition.y + 1);
                break;
            case 3: // Left
                newPosition = CGPointMake(currentPosition.x - 1, currentPosition.y);
                break;
            case 4: // Right
                newPosition = CGPointMake(currentPosition.x + 1, currentPosition.y);
                break;
        }
        //5
        if([self.tiles isValidTileCoordinateAt:newPosition] &&
           ![self.tiles isEdgeTileAt:newPosition] &&
           [self.tiles tileTypeAt:newPosition] == MapTileTypeNone)
        {
            currentPosition = newPosition;
            [self.tiles setTileType:MapTileTypeFloor at:currentPosition];
            currentFloorCount++;
        }
    }
    // 6
    //_exitPoint = currentPosition;
    _exitPoint = [self convertMapCoordinateToWorldCoordinate:currentPosition];
    // 7
    NSLog(@"%@", [self.tiles description]);
    _spawnPoint = [self convertMapCoordinateToWorldCoordinate:startPoint];
}

- (void) generateTiles
{
    // 1
    
    // OLD Y ( NSInteger y = 0; y < self.tiles.gridSize.height; y++ )
    // OLD X ( NSInteger x = 0; x < self.tiles.gridSize.width; x++ )
    
    
    for (NSInteger y = (self.tiles.gridSize.height-1); y> -1 ; y--)
    {
        for (NSInteger x = (self.tiles.gridSize.width-1); x> -1 ; x--)
        {
            // 2
            CGPoint tileCoordinate = CGPointMake(x, y);
            // 3
            MapTileType tileType = [self.tiles tileTypeAt:tileCoordinate];
            // 4
            if ( tileType != MapTileTypeNone )
            {
                // 5
                SKTexture *tileTexture = [self.tileAtlas textureNamed:[NSString stringWithFormat:@"%li", tileType]];
                SKSpriteNode *tile = [SKSpriteNode spriteNodeWithTexture:tileTexture];
                // 6
                //tile.position = tileCoordinate;
                tile.position = [self convertMapCoordinateToWorldCoordinate:CGPointMake(tileCoordinate.x, tileCoordinate.y)];
                // 7
                [self addChild:tile];
            }
        }
    }
}

- (CGPoint) convertMapCoordinateToWorldCoordinate:(CGPoint)mapCoordinate
{
   
  return CGPointMake((mapCoordinate.x * self.tileSize/2) - (mapCoordinate.y * self.tileSize/2), (mapCoordinate.x * self.tileSize/4)+(mapCoordinate.y * self.tileSize/4));
    
   // return CGPointMake(mapCoordinate.x * 64,  (self.tiles.gridSize.height - mapCoordinate.y) * 32);
}



- (NSInteger) randomNumberBetweenMin:(NSInteger)min andMax:(NSInteger)max
{
    return min + arc4random() % (max - min);
}

- (void) addCollisionWallAtPosition:(CGPoint)position withSize:(CGSize)size
{
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"wallTexture.png"];
    
    CGFloat offsetX = sprite.frame.size.width * sprite.anchorPoint.x;
    CGFloat offsetY = sprite.frame.size.height * sprite.anchorPoint.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 1 - offsetX, 24 - offsetY);
    CGPathAddLineToPoint(path, NULL, 30 - offsetX, 63 - offsetY);
    CGPathAddLineToPoint(path, NULL, 63 - offsetX, 48 - offsetY);
    CGPathAddLineToPoint(path, NULL, 63 - offsetX, 15 - offsetY);
    CGPathAddLineToPoint(path, NULL, 31 - offsetX, 0 - offsetY);
    CGPathAddLineToPoint(path, NULL, 0 - offsetX, 16 - offsetY);
    
    CGPathCloseSubpath(path);
    
    
    
    //
    
    sprite.position = CGPointMake(position.x, position.y);
    sprite.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];

    sprite.physicsBody.dynamic = NO;
    sprite.physicsBody.categoryBitMask = CollisionTypeWall;
    sprite.physicsBody.contactTestBitMask = 0;
    sprite.physicsBody.collisionBitMask = CollisionTypePlayer;
    sprite.zPosition = 1;
    
    [self addChild:sprite];
}



- (void) generateCollisionWalls
{
    for ( NSInteger y = 0; y < self.tiles.gridSize.height; y++ )
    {
        for ( NSInteger x = 0; x < self.tiles.gridSize.width; x++ )
        {
            CGPoint tileCoordinate = CGPointMake(x, y);
            CGSize wallSize = CGSizeMake(self.tileSize, self.tileSize/2);
            // 1
            if ( [self.tiles tileTypeAt:tileCoordinate] == MapTileTypeWall )
            {
                
                [self addCollisionWallAtPosition:[self convertMapCoordinateToWorldCoordinate:tileCoordinate]
                                        withSize:wallSize];
                            }
        }
    }
}


@end
