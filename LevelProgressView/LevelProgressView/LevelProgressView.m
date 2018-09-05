//
//  LevelProgressView.m
//  LevelProgressView
//
//  Created by 牛清旭 on 2018/9/4.
//  Copyright © 2018年 牛清旭. All rights reserved.
//

#import "LevelProgressView.h"
//描述颜色
#define VMNoticeColor VMRGBColor(153,153,153)
/** 字体*/
#define VMFont(x) [UIFont systemFontOfSize:x]
#define VMBoldFont(x) [UIFont boldSystemFontOfSize:x]
#define VMMediumFont(x) [UIFont fontWithName:@"PingFangSC-Medium" size:x]
/** 颜色*/
#define VMRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define VMRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@implementation LevelProgressView


- (NSArray *)stateArray
{
    if (!_stateArray) {
        _stateArray = [NSArray array];
    }
    
    return _stateArray;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _stateArray = @[@"state1", @"state2", @"state3", @"state4"];
        _font = VMFont(12);
        
        self.backgroundColor = [UIColor clearColor];
        _color = VMRGBAColor(1.0,0, 128, 0);
        _tintColor = VMRGBAColor(255,125,37,1);
        
        _radius = 5.f;
        _gap = 1.0f;
        _lineWidth=2.0;
        _textOffsetY=12.0f;
        _textHeight = 20.0f;
        _cycleOffsetY = self.frame.size.height/3;
    }
    
    return self;
}

// 覆盖drawRect方法，你可以在此自定义绘画和动画
- (void)drawRect:(CGRect)rect
{
    int n = (int)_stateArray.count; // 进度节点个数
    int cur =(int) _currentState;        // 当前进度节点
    int circleRadius = _radius;     // 原型半径大小
    int lineGap = _gap;             // 线段与原型的间隔大小
    CGFloat half = (CGFloat)_half;
    // 一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (int i = 0; i < n; i++) {
        int xx = rect.origin.x + (1 + 2 * i) * rect.size.width / (2 * n);   // 圆心x坐标
        //        int yy = rect.origin.y + rect.size.height / 2;                      // 圆心y坐标
        int yy = _cycleOffsetY;                      // 圆心y坐标
        
        int xx1 = xx + circleRadius + lineGap;                              // 线段终点坐标
        int xx2 = xx + rect.size.width / n - (circleRadius + lineGap);      // 线段终点坐标
        
        if (half) {
            int halfxx1 =  rect.size.width / n *(cur-half);                              // 线段终点坐标
            int halfxx2 = rect.size.width / n *(cur) ;      // 线段终点坐标
            if (cur != n) {
                [self drawLine:context startPoint:CGPointMake(halfxx1+4, yy) endPoint:CGPointMake(halfxx2, yy) style:1];  // 画笔线的颜色
            }
        }
        
        
        if (i < cur) {
            // 已完成进度-
            // 画圆
            [self drawCircle:context point:CGPointMake(xx, yy) radius:circleRadius style:1];
            
            // 线段
            if (i < cur - 1) {
                [self drawLine:context startPoint:CGPointMake(xx1, yy) endPoint:CGPointMake(xx2, yy) style:1];  // 画笔线的颜色
                if (self.needBigText == 1) {
                    
                    if (i == 3) {
                        if (self.changeColor == 1) {
                            [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:0];
                            
                        }else{
                            [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:0];
                            
                        }
                    }else{
                        [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:3];
                        
                    }
                }else{
                    [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:0];
                }
            }else if(cur == n){
                
                if (self.needBigText == 1) {
                    [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY-10, rect.size.width, _textHeight) text:_stateArray[i] style:5];
                    
                }else{
                    [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:3];
                }
            } else{
                [self drawLine:context startPoint:CGPointMake(xx1, yy) endPoint:CGPointMake(xx2, yy) style:0];  // 画笔线的颜色
                if (self.needBigText == 1) {
                    [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:2];
                    
                }else{
                    [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:3];
                    
                }
                
            }
        }else if (i == cur){
            
            if (self.needBigText == 1) {
                [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY-10, rect.size.width, _textHeight) text:_stateArray[i] style:1];
                
            }else{
                [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:0];
                
            }
            [self drawCircle:context point:CGPointMake(xx, yy) radius:circleRadius style:0];
            if (i < n - 1) {
                [self drawLine:context startPoint:CGPointMake(xx1, yy) endPoint:CGPointMake(xx2, yy) style:0];
            }
        } else {
            // 未完成进度-
            // 文字
            [self drawText:context rect:CGRectMake(xx - rect.size.width / 2, yy + _textOffsetY, rect.size.width, _textHeight) text:_stateArray[i] style:0];
            // 圆环
            [self drawCircle:context point:CGPointMake(xx, yy) radius:circleRadius style:0];
            // 线段
            if (i < n - 1) {
                [self drawLine:context startPoint:CGPointMake(xx1, yy) endPoint:CGPointMake(xx2, yy) style:0];
            }
            
        }
    }
}

- (void)styleWithContext:(CGContextRef)context style:(int)type
{
    UIColor *color = [UIColor alloc];
    
    if (type == 0) {
        color = _tintColor;
    } else {
        color = _color;
    }
    
    NSDictionary *colorDic = [self getRGBDictionaryByColor:color];
    int r = [colorDic[@"R"] floatValue] * 255;
    int g = [colorDic[@"G"] floatValue] * 255;
    int b = [colorDic[@"B"] floatValue] * 255;
    int a = [colorDic[@"A"] floatValue];

    CGContextSetRGBStrokeColor(context, r / 255.0, g / 255.0, b / 255.0, a);        // 圆圈填充色
    CGContextSetFillColorWithColor(context, color.CGColor);                         // 填充颜色
}

- (void)drawLine:(CGContextRef)context startPoint:(CGPoint)aPoint endPoint:(CGPoint)bPoint style:(int)type
{
    [self styleWithContext:context style:type];
    CGPoint aPoints[2];                     // 坐标点
    aPoints[0] = aPoint;                    // 坐标1
    aPoints[1] = bPoint;                    // 坐标2
    CGContextAddLines(context, aPoints, 2); // 添加线
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)drawCircle:(CGContextRef)context point:(CGPoint)aPoint radius:(CGFloat)radius style:(int)type
{
    [self styleWithContext:context style:type];
    CGContextSetLineWidth(context, _lineWidth);                                // 线的宽度
    CGContextAddArc(context, aPoint.x, aPoint.y, radius, 0, 2 * PI, 0); // 添加一个圆
    // kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    
    if (self.needShiXin == 1) {
        CGContextDrawPath(context, kCGPathFillStroke);
    }else{
        if (type == 1) {
            CGContextDrawPath(context, kCGPathStroke);
        }else{
            CGContextDrawPath(context, kCGPathFillStroke);
        }
    }
    
    
}

- (void)drawText:(CGContextRef)context rect:(CGRect)rect text:(NSString *)text style:(int)type
{
    UIColor *fontColor = [UIColor alloc];
    
    if (type == 0) {
        fontColor = VMNoticeColor;
        _font = VMFont(12);
    }else if(type == 1){
        fontColor = VMNoticeColor;
        _font = VMMediumFont(16);
    }else if(type == 5){
        fontColor = _color;
        _font = VMMediumFont(16);
    } else {
        fontColor = _color;
        _font = VMMediumFont(12);
    }
    // 文字
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    NSDictionary *dic = @{NSFontAttributeName:_font, NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName:fontColor};
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [text drawInRect:rect withAttributes:dic];
}

// color转RGB
- (NSDictionary *)getRGBDictionaryByColor:(UIColor *)originColor
{
    CGFloat r = 0, g = 0, b = 0, a = 0;

    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [originColor getRed:&r green:&g blue:&b alpha:&a];
    } else {
        const CGFloat *components = CGColorGetComponents(originColor.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }

    return @{@"R":@(r), @"G":@(g), @"B":@(b), @"A":@(a)};
}

@end
