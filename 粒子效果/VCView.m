//
//  VCView.m
//  粒子效果
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "VCView.h"


@interface VCView ()

@property(nonatomic, strong) UIBezierPath *path;

@property(nonatomic, weak)CALayer *dotLayer;


@end
@implementation VCView

+(Class)layerClass
{
    return [CAReplicatorLayer class];
    
}


-(void)awakeFromNib
{
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    

    [self addGestureRecognizer:pan];
    
    
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    
    self.path = path;
    
    
    //创建粒子
    CALayer *dotLayer = [CALayer layer];
    
    dotLayer.frame = CGRectMake(-10, 0, 10, 10);
    
    dotLayer.backgroundColor = [UIColor redColor].CGColor;
    
    self.dotLayer = dotLayer;

    [self.layer addSublayer:dotLayer];
    
    
    
//    //添加动画
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//    anim.keyPath = @"position";
//    anim.path = self.path.CGPath;
//    
//    [dotLayer addAnimation:anim forKey:nil];
//    

    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 30;
    repL.instanceDelay = 0.25;
    
}

//开始
- (void)start
{
    //添加动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.path = self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
//    anim.duration = 4;
    
    [self.dotLayer addAnimation:anim forKey:nil];
    
}

//重绘
- (void)reDraw
{
//    //添加动画
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//    
//    anim.keyPath = @"position";
//    anim.path = self.path.CGPath;
//    [self.dotLayer addAnimation:anim forKey:nil];
    
    //把路径清空
    [self.path removeAllPoints];
    [self setNeedsDisplay];
    
    
    //移除动画
    [self.dotLayer removeAllAnimations];
    
}


-(void)pan:(UIPanGestureRecognizer *)pan
{
    //开始绘制
    //获取手指当前的点
    CGPoint curP = [pan locationInView:self];
    
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        

        [self.path moveToPoint:curP];
        
        
    }else if (pan.state == UIGestureRecognizerStateChanged)
    {
        [self.path addLineToPoint:curP];
        

        //重绘
        [self setNeedsDisplay];
    }
    
}
- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}


@end
