//
//  draw_View.m
//  drawing board
//
//  Created by yangjian on 2016/11/30.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#import "draw_View.h"
@interface draw_View()

@property (nonatomic,strong)NSMutableArray * pathArray;

@end

@implementation draw_View

-(NSMutableArray *)pathArray{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

- (void)drawRect:(CGRect)rect {
    [[UIColor redColor]set];
    for (UIBezierPath *path in self.pathArray) {
        [path stroke];
    }
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:touch.view];

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(startPoint.x, startPoint.y)];
    
    [path setLineWidth:6];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];
    
    [self.pathArray addObject:path];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:touch.view];
    
    UIBezierPath *currentPath = [self.pathArray lastObject];
    [currentPath addLineToPoint:CGPointMake(movePoint.x, movePoint.y)];
    
    [self setNeedsDisplay];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
    
//    UITouch *touch = [touches anyObject];
//    CGPoint endPoint = [touch locationInView:touch.view];
//    
//    UIBezierPath *currentPath = [self.pathArray lastObject];
//    [currentPath addLineToPoint:CGPointMake(endPoint.x, endPoint.y)];
//    
//    [self setNeedsDisplay];
    
}


-(void)clearView{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}
-(void)backView{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}













@end
