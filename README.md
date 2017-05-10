# drawingBoard
一款简单的涂鸦画板，适合初学者了解画板的实现原理


使用方法：
    
    
//    通过数组的方式来绘制线段

    drawView = [[YJ_View alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(clearBtn.frame)+10,screen_width, screen_height-CGRectGetMaxY(clearBtn.frame)-10- 40)];
    drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawView];
    
    
//通过path方式来绘制线段

    mainView = [[draw_View alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(clearBtn.frame)+10,screen_width, screen_height-CGRectGetMaxY(clearBtn.frame)-10- 40)];
    mainView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mainView];
