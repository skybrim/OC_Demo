//
//  ViewController.m
//  demo
//
//  Created by wiley on 2019/11/22.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic, copy, readwrite) NSString *testName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    AVPlayer *p = [AVPlayer playerWithURL:[NSURL URLWithString:@""]];
    
    
}


@end
