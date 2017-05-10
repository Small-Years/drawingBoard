//
//  YJ_View.m
//  drawing board
//
//  Created by yangjian on 2016/11/29.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#import "YJ_View.h"
@interface YJ_View()

@property (nonatomic,strong)NSMutableArray * totalArray;
//@property (nonatomic,strong)NSMutableArray * subArray;

@end

@implementation YJ_View

-(NSMutableArray *)totalArray{
    if (_totalArray == nil) {
        _totalArray = [NSMutableArray array];
    }
    return _totalArray;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:touch.view];
    
    NSMutableArray *subArr = [NSMutableArray array];
    [subArr addObject:[NSValue valueWithCGPoint:startPoint]];
    [self.totalArray addObject:subArr];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:touch.view];
    NSMutableArray *subArr = [self.totalArray lastObject];
    [subArr addObject:[NSValue valueWithCGPoint:movePoint]];
    [self setNeedsDisplay];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
    /*
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:touch.view];
    NSMutableArray *subArr = [self.totalArray lastObject];
    [subArr addObject:[NSValue valueWithCGPoint:endPoint]];
    [self setNeedsDisplay];
     */
}


// 画线
- (void)drawRect:(CGRect)rect
{
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 遍历大数组,取出所有的小数组(每一个小数组代表一条线段)
    for (NSMutableArray *subPointArray in self.totalArray) {
        // 遍历小数组, 取出小数组中所有的点
        for (int index = 0; index < subPointArray.count; index++) {
            // 1.取出小数组中的每一个点
            CGPoint point = [subPointArray[index] CGPointValue];
            // 2.绘制线段
            if (0 == index) {
                // 2.1. 设置线段的起点
                CGContextMoveToPoint(ctx, point.x, point.y);
            }else
            {
                // 2.2.设置线段的终点
                CGContextAddLineToPoint(ctx, point.x, point.y);
            }
        }
    }
    
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextSetLineWidth(ctx, 10);
    
    // 3.渲染
    CGContextStrokePath(ctx);
    
}


-(void)clearView{
    [self.totalArray removeAllObjects];
    [self setNeedsDisplay];
}
-(void)backView{
    [self.totalArray removeLastObject];
    [self setNeedsDisplay];
}















@end
