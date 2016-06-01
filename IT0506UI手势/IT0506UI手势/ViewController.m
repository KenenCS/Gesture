//
//  ViewController.m
//  IT0506UI手势
//
//  Created by student on 16/5/24.
//  Copyright © 2016年 chenShuai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //UI手势就是作用在UI控件上，目的是让指定的UI控件有丰富的交互手势
//    UITapGestureRecognizer Tap(点击)
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    //轻击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    //点击几次才算一次
    tap.numberOfTapsRequired = 1;
    //几根手指
    tap.numberOfTouchesRequired = 1;
    [bgView addGestureRecognizer:tap];
    
    //双击事件
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(douleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [bgView addGestureRecognizer:doubleTap];
    
    //拖动事件
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    [bgView addGestureRecognizer:pan];
    
    //捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [bgView addGestureRecognizer:pinch];
    
    //旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [bgView addGestureRecognizer:rotation];
    
    
    //关键的一行(让单机事件和双击事件都有用)
    //当双击手势确定检测失败时才会触发单机手势
    [tap requireGestureRecognizerToFail:doubleTap];
    
    
    //长按手势
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    [bgView addGestureRecognizer:longP];
    
    
    //滑动手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [bgView addGestureRecognizer:swipe];
    
}

//滑动手势
- (void)swipe:(UISwipeGestureRecognizer *)swipe {
    
    CGPoint point = [swipe locationInView:self.view];
    
    [UIView animateWithDuration:1.0 animations:^{
        swipe.view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    }];
    
    
    NSLog(@"%s",__FUNCTION__);
    
}

//长按手势
- (void)longP:(UILongPressGestureRecognizer *)longP {
    
    NSLog(@"time : %f",longP.minimumPressDuration);
    
}

//双击事件
- (void)douleTap:(UITapGestureRecognizer *)doubleTap {
    
    NSLog(@"%s",__FUNCTION__);
}

//旋转手势
- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    rotation.rotation = 0;
    
}

//捏合手势
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    
    NSLog(@"scale : %f",pinch.scale);
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}

//拖动事件
- (void)pan:(UIPanGestureRecognizer *)pan {
    
//    NSLog(@"%s",__FUNCTION__);
    NSLog(@"拖移，慢慢的:%@",NSStringFromCGPoint(pan.view.center));
    
    CGPoint transLocation = [pan translationInView:self.view];
    pan.view.center = CGPointMake(pan.view.center.x + transLocation.x, pan.view.center.y + transLocation.y);
    [pan setTranslation:CGPointZero inView:self.view];

}

//点击事件
- (void)tap:(UITapGestureRecognizer *)tap {
    
    NSLog(@"%s",__FUNCTION__);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
