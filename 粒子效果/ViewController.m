//
//  ViewController.m
//  粒子效果
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "VCView.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet VCView *vcView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)startView:(id)sender
{
    [self.vcView start];
}



- (IBAction)reDraw:(id)sender
{
    [self.vcView reDraw];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
