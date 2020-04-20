//
//  main.m
//  demo
//
//  Created by wiley on 2019/11/22.
//  Copyright © 2019 wiley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef void (^ByBlock)(void);
@interface TestObj : NSObject
@property (nonatomic, copy) ByBlock block;
@end
@implementation TestObj
- (void)testMethod {
//    __strong TestObj *sSelf = self;
    if (self.block) {
        self.block();
    }
    NSLog(@"%@", self);
}
@end

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        __block TestObj *testObj = [TestObj new];
        testObj.block = ^{
            testObj = nil;
            NSLog(@"2");
        };
        [testObj testMethod];
        
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
