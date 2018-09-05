//
//  LevelProgressView.h
//  LevelProgressView
//
//  Created by 牛清旭 on 2018/9/4.
//  Copyright © 2018年 牛清旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define PI 3.14159265358979323846
@interface LevelProgressView : UIView
//定义颜色
@property(nonatomic,strong)UIColor *color;//正常已完成颜色
@property(nonatomic,strong)UIColor *tintColor;//未完成浅色
//定义尺寸
@property(nonatomic,assign)int radius;//圆形的半径大小
@property(nonatomic,assign)CGFloat lineWidth;//线宽（包括圆形的边框和线段的宽度）
@property(nonatomic,strong)UIFont *font;//文字大小
@property(nonatomic,assign)CGFloat gap;//圆形与线段的留白大小
//定义位置
@property(nonatomic,assign)CGFloat textOffsetY;//文本相对于圆形的向下偏移量
@property(nonatomic,assign)CGFloat textHeight;//文本区域的高度
@property(nonatomic,assign)CGFloat cycleOffsetY;//圆形的向下偏移量


//定义数据
@property(nonatomic,assign)int currentState;//当前进度
@property(nonatomic,assign)CGFloat half;//当前进度是否需要一半

@property(nonatomic,copy)NSArray *stateArray;//进度状态列表

@property(nonatomic,assign)NSInteger needBigText;//是否需要放大文字 1：YES 2 ：NO
@property(nonatomic,assign)NSInteger needShiXin;//是否需要实心 1：YES 2 ：NO
@property(nonatomic,assign)NSInteger changeColor;//是否需要倒数第二个level换颜色 1：YES 2 ：NO
@end
