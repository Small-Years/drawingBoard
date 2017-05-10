//
//  UIImage+photoView.m
//  drawing board
//
//  Created by yangjian on 2016/11/29.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#import "UIImage+photoView.h"

@implementation UIImage (photoView)

+(UIImage *)photoImageWithView:(UIView *)view{
    // 1.创建bitmap上下文
    UIGraphicsBeginImageContext(view.frame.size);
    // 2.将要保存的view的layer绘制到bitmap上下文中
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 3.取出绘制号的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}

@end
