//
//  ViewController.m
//  drawing board
//
//  Created by yangjian on 2016/11/29.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#import "ViewController.h"
#import "YJ_View.h"
#import "UIImage+photoView.h"
#import "MBProgressHUD+NJ.h"
#import "draw_View.h"

#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{
    YJ_View *drawView;
    
    draw_View *mainView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
//  清除
    UIButton *clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(0 , 30 , screen_width/3, 40)];
    [clearBtn setTitle:@"清除" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
//    回退
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(clearBtn.frame) ,clearBtn.frame.origin.y ,clearBtn.bounds.size.width,clearBtn.bounds.size.height)];
    [backBtn setTitle:@"回退" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
//    保存
    UIButton *saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(backBtn.frame) ,clearBtn.frame.origin.y ,clearBtn.bounds.size.width,clearBtn.bounds.size.height)];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
//    画板View:::
    
//    通过数组的方式来绘制线段
//    drawView = [[YJ_View alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(clearBtn.frame)+10,screen_width, screen_height-CGRectGetMaxY(clearBtn.frame)-10- 40)];
//    drawView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:drawView];
    
    
//通过path方式来绘制线段
    mainView = [[draw_View alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(clearBtn.frame)+10,screen_width, screen_height-CGRectGetMaxY(clearBtn.frame)-10- 40)];
    mainView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:mainView];

}

-(void)clearView{
    [mainView clearView];
}

-(void)backView{
    [mainView backView];
}

-(void)saveView{
    UIImage *newImage = [UIImage photoImageWithView:mainView];
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        [MBProgressHUD showError:@"保存失败"];
    }else
    {
        [MBProgressHUD showSuccess:@"保存成功"];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
