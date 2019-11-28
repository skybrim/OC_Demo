//
//  WLog.m
//  demo
//
//  Created by wiley on 2019/11/28.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "WLog.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

#if DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelDebug;
#elif RELEASE
static const DDLogLevel ddLogLevel = DDLogLevelInfo;
#endif

@implementation WLog

+ (void)initLog {
    [DDLog addLogger:[DDOSLogger sharedInstance]]; // Uses os_log
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    DDLogInfo(@"fileLogger.path-\n%@", fileLogger.currentLogFileInfo.filePath);
    __unused NSString *localDocPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

@end
