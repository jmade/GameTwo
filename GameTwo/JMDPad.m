//
//  JMDPad.m
//  GameTwo
//
//  Created by Justin Madewell on 3/4/14.
//  Copyright (c) 2014 Justin Madewell. All rights reserved.
//

#import "JMDPad.h"

@implementation JMDPad
{
    SKShapeNode *base;
    SKShapeNode *stick;
    SKShapeNode *upNode;
    SKShapeNode *downNode;
    SKShapeNode *leftNode;
    SKShapeNode *rightNode;
    UITouch *nodeTouch;
    
    SKShapeNode *theTouchedNode;
    NSMutableArray *dirNodes;
}

- (instancetype) initWithRect:(CGRect)rect
{
    if (( self = [super init] ))
    {
        // Set position of node
        _velocity = CGPointZero;
        self.isActive = NO;
        self.zPosition = 50;
        dirNodes = [[NSMutableArray alloc]initWithCapacity:4];
       
        self.position = rect.origin;
        CGFloat widthFlt = rect.size.width;
        CGFloat heightFlt = rect.size.height;
        CGRect qtrRect = CGRectMake(0, 0, widthFlt/2, heightFlt/2);
    
        // UP
        upNode = [SKShapeNode node];
        upNode.name = @"upNode";
        upNode.position = CGPointMake((widthFlt/2), (widthFlt));
        upNode.fillColor = [UIColor grayColor];
        upNode.strokeColor = [UIColor blackColor];
        upNode.lineWidth = 1.0f;
        upNode.path = CGPathCreateWithRoundedRect(qtrRect, 5, 5, NULL);
        [dirNodes addObject:upNode];
        [self addChild:upNode];
        
        // Down
        downNode = [SKShapeNode node];
        downNode.name = @"downNode";
        downNode.position = CGPointMake((widthFlt/2), 0);
        downNode.fillColor = [UIColor grayColor];
        downNode.strokeColor = [UIColor blackColor];
        downNode.lineWidth = 1.0f;
        downNode.path = CGPathCreateWithRoundedRect(qtrRect, 5, 5, NULL);
        [dirNodes addObject:downNode];
        [self addChild:downNode];
        
        // Left
        leftNode = [SKShapeNode node];
        leftNode.name = @"leftNode";
        leftNode.position = CGPointMake(0, (widthFlt/2));
        leftNode.fillColor = [UIColor grayColor];
        leftNode.strokeColor = [UIColor blackColor];
        leftNode.lineWidth = 1.0f;
        leftNode.path = CGPathCreateWithRoundedRect(qtrRect, 5, 5, NULL);
        [dirNodes addObject:leftNode];
        [self addChild:leftNode];
        
        // Right
        rightNode = [SKShapeNode node];
        rightNode.name = @"rightNode";
        rightNode.position = CGPointMake(widthFlt,(widthFlt/2));
        rightNode.fillColor = [UIColor grayColor];
        rightNode.strokeColor = [UIColor blackColor];
        rightNode.lineWidth = 1.0f;
        rightNode.path = CGPathCreateWithRoundedRect(qtrRect, 5, 5, NULL);
        [dirNodes addObject:rightNode];
        [self addChild:rightNode];
        

        // Enable touch
        self.userInteractionEnabled = YES;
        self.alpha = 0.85;
    }

    return self;
}

-(void)updateVelocity:(NSString *)nodeName
{
    if ([nodeName isEqual: @"upNode"])
    {
        _direction = @"UP";
        _velocity = CGPointMake(-1,0.5);
    }
    if ([nodeName isEqual: @"downNode"])
    {
        _direction = @"DOWN";
        _velocity = CGPointMake(1,-0.5);
    }
    if ([nodeName isEqual: @"leftNode"])
    {
        _direction = @"LEFT";
        _velocity = CGPointMake(-1, -0.5);
    }
    if ([nodeName isEqual: @"rightNode"])
    {
        _direction = @"RIGHT";
        _velocity = CGPointMake(1, 0.5);
    }
    
    CGPoint up = CGPointMake(-1, 1);
    CGPoint down = CGPointMake(1, -1);
    CGPoint left = CGPointMake(-1, -1);
    CGPoint right = CGPointMake(1, 1);
}

-(void)setTouchedNode:(SKShapeNode *)touchedNode
{
    if (theTouchedNode == touchedNode) {
       // NSLog(@"Touched Node is the Same");
        [self updateVelocity:theTouchedNode.name];
        [theTouchedNode setStrokeColor:[UIColor blueColor]];
        
    }
    
    if (theTouchedNode != touchedNode)
    {
        //NSLog(@"Touched Node Changed");
        [theTouchedNode setStrokeColor:[UIColor blackColor]];
        _velocity = CGPointZero;
        if ([dirNodes containsObject:touchedNode])
        {
            theTouchedNode = touchedNode;
            [self updateVelocity:theTouchedNode.name];
            [theTouchedNode setStrokeColor:[UIColor blueColor]];
        }

    }
    
    
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.isActive = YES;
    UITouch *touch = [touches anyObject];
   
    SKShapeNode *touchedNode = (SKShapeNode *)[self nodeAtPoint:[touch locationInNode:self]];
    
    [self setTouchedNode:touchedNode];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    SKShapeNode *touchedNode = (SKShapeNode *)[self nodeAtPoint:[touch locationInNode:self]];
    [self setTouchedNode:touchedNode];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.isActive = NO;
    _velocity = CGPointZero;
    theTouchedNode = nil;
    
    for (SKShapeNode *node in dirNodes){
        [node setStrokeColor:[UIColor blackColor]];
    }
}


@end
