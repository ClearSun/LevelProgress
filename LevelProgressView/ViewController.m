//
//  ViewController.m
//  LevelProgressView
//
//  Created by 牛清旭 on 2018/9/4.
//  Copyright © 2018年 牛清旭. All rights reserved.
//

#import "ViewController.h"
#import "LevelProgressView.h"
#define VMRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface ViewController ()
@property(nonatomic ,strong) LevelProgressView *progressView;
@property(nonatomic ,strong) UIScrollView *backView;

@property(nonatomic ,strong) LevelProgressView *progressView2;
@property(nonatomic ,strong) UIScrollView *backView2;

@property(nonatomic ,strong) LevelProgressView *progressView3;
@property(nonatomic ,strong) UIScrollView *backView3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)setupUI{
    
    // ***************************************************************
    // level背景滚动scrollview
    self.backView.contentSize = CGSizeMake(self.view.frame.size.width*2+100, 100);
    self.backView.frame = CGRectMake(0, 100, self.view.frame.size.width, 100);
    self.backView.showsHorizontalScrollIndicator = NO;
    self.backView.showsVerticalScrollIndicator = NO;
//    self.backView.scrollEnabled = NO;
    [self.view addSubview:self.backView];
    
    NSArray *levelArray =  @[ @"客户专员", @"客户经理", @"中级客户经理", @"高级客户经理", @"特级客户经理"];
    self.progressView = [[LevelProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*1.7, 100)];
    [self.backView addSubview:self.progressView];
    self.progressView.stateArray =  levelArray;
    self.progressView.color = VMRGBAColor(255,125,37,1);
    self.progressView.tintColor = VMRGBAColor(204,204,204,1);
    self.progressView.needBigText = 1;
    self.progressView.needShiXin = 2;
    self.progressView.changeColor = 1;
    self.progressView.textOffsetY = -25;
    self.progressView.cycleOffsetY = 40;
    self.progressView.half = 0.5;
    self.progressView.color = VMRGBAColor(226,69,66,1);
    
    NSInteger level;
    level = 3;
    self.progressView.currentState = (int)level; // 第几个等级

    
    [self.backView setContentOffset:CGPointMake(self.view.frame.size.width/3*(level-1)+level*1.2,0) animated:YES];

    // ***************************************************************

    
    
    
    self.backView2.contentSize = CGSizeMake(self.view.frame.size.width*2+100, 100);
    self.backView2.frame = CGRectMake(0, 300, self.view.frame.size.width, 100);
    self.backView2.showsHorizontalScrollIndicator = NO;
    self.backView2.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.backView2];

    self.progressView2 = [[LevelProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*1.7, 100)];
    [self.backView2 addSubview:self.progressView2];
    
    
    self.progressView2.stateArray =  @[ @"客户专员", @"客户经理", @"中级客户经理", @"高级客户经理", @"特级客户经理"];
    self.progressView2.color = VMRGBAColor(255,125,37,1);
    self.progressView2.tintColor = VMRGBAColor(204,204,204,1);
    self.progressView2.needBigText = 2;
    self.progressView2.needShiXin = 1;
    self.progressView2.currentState = (int)(level);

    
    // ***************************************************************
    // level背景滚动scrollview
    self.backView3.contentSize = CGSizeMake(self.view.frame.size.width*2+100, 100);
    self.backView3.frame = CGRectMake(0, 450, self.view.frame.size.width, 100);
    self.backView3.showsHorizontalScrollIndicator = NO;
    self.backView3.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.backView3];
    
    self.progressView3 = [[LevelProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*1.7, 100)];
    [self.backView3 addSubview:self.progressView3];
    self.progressView3.stateArray =  levelArray;
    self.progressView3.color = VMRGBAColor(255,125,37,1);
    self.progressView3.tintColor = VMRGBAColor(204,204,204,1);
    self.progressView3.needBigText = 2;
    self.progressView3.needShiXin = 2;
    self.progressView3.changeColor = 1;
    self.progressView3.textOffsetY = -25;
    self.progressView3.cycleOffsetY = 40;
    self.progressView3.half = 0.5;
    self.progressView3.color = VMRGBAColor(226,69,66,1);
    self.progressView3.currentState = (int)level; // 第几个等级
    
    
    [self.backView3 setContentOffset:CGPointMake(self.view.frame.size.width/3*(level-1)+level*1.2,0) animated:YES];
    
    // ***************************************************************

}
#pragma mark - Lazy
- (UIScrollView *)backView{
    if (!_backView) {
        _backView = [[UIScrollView alloc] init];
    }
    return _backView;
}

- (UIScrollView *)backView2{
    if (!_backView2) {
        _backView2 = [[UIScrollView alloc] init];
    }
    return _backView2;
}

- (UIScrollView *)backView3{
    if (!_backView3) {
        _backView3 = [[UIScrollView alloc] init];
    }
    return _backView3;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
