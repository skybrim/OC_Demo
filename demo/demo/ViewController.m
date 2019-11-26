//
//  ViewController.m
//  demo
//
//  Created by wiley on 2019/11/22.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "WAdapter.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy, readwrite) NSString *testName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    // automaticallyAdjustsScrollViewInsets 被 contentInsetAdjustmentBehavior 替代
    // contentInsetAdjustmentBehavior 属性，只支持 iOS 11 及以上， 需要考虑适配
    // 默认设置（即不设置），在 nav 下都可以正常显示，没有 nav 时，iOS 11 以下会覆盖到 statusBar 上
    // 支持 iOS 11 以下时，需要对此适配
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}


@end
