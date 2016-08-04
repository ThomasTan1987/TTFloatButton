//
//  TTFloatButton.m
//  TutorTalk-Consultant
//
//  Created by ThoamsTan on 16/8/4.
//  Copyright © 2016年 eddytsai. All rights reserved.
//

#import "TTFloatButton.h"
@interface TTFloatButton()
@property(nonatomic, strong)NSValue *startPoint;
@property (nonatomic, copy)FloatButtonTaped floatButtonTaped;
@end
@implementation TTFloatButton
static TTFloatButton *floatButton = nil;
+ (TTFloatButton *)sharedFloatButtonWithBlock:(FloatButtonTaped)floatButtonTaped
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        floatButton = [[TTFloatButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        floatButton.backgroundColor = [UIColor grayColor];
        floatButton.floatButtonTaped = floatButtonTaped;
        floatButton.layer.cornerRadius = 5;
        floatButton.windowLevel = UIWindowLevelAlert + 1;
        floatButton.hidden = NO;
        floatButton.rootViewController = [[UIViewController alloc] init];
        //
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:floatButton action:@selector(panGesture:)];
        [floatButton addGestureRecognizer:pan];
        //
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:floatButton action:@selector(tapGesture:)];
        [floatButton addGestureRecognizer:tap];
    });
    return floatButton;
}
- (void)panGesture:(UIPanGestureRecognizer*)pan
{
    switch (pan.state) {
        case UIGestureRecognizerStateBegan: {
            CGPoint currentPoint = [pan translationInView:[UIApplication sharedApplication].keyWindow];
            self.startPoint = [NSValue valueWithCGPoint:currentPoint];
            break;
        }
        case UIGestureRecognizerStateChanged: {
            
            CGPoint offset = [pan translationInView:[UIApplication sharedApplication].keyWindow];
            
            //通过计算偏移量来设定新坐标
            [self setCenter:CGPointMake(self.center.x + offset.x, self.center.y + offset.y)];
            //初始化sender中的坐标位置。如果不初始化，移动坐标会一直积累起来。
            [pan setTranslation:CGPointMake(0, 0) inView:[UIApplication sharedApplication].keyWindow];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed: {
//            CGPoint currentPoint = [pan translationInView:[UIApplication sharedApplication].keyWindow];
//            self.center = currentPoint;
            break;
        }
        default:
            break;
    }
}
- (void)tapGesture:(UITapGestureRecognizer*)tap
{
    if (self.floatButtonTaped)
    {
        self.floatButtonTaped();
    }
}
@end
