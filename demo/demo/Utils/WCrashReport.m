//
//  WCrashReport.m
//  demo
//
//  Created by wiley on 2019/11/27.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "WCrashReport.h"
#import <execinfo.h>

@implementation WCrashReport

+ (void)W_caughtException {
    //当错误发生时候，先在最底层产生Mach异常
    
    // 1 Mach异常在host层被转换为相应的Unix Signal; 在OC层如果有对应的NSException（OC异常），就转换成OC异常。
    // NSexception
    NSSetUncaughtExceptionHandler(HandleNSException);
    
    // 2 如果OC异常一直得不到处理，程序会强行发送SIGABRT信号中断程序。
    //signal
    signal(SIGABRT, SignalExceptionHandler);
    signal(SIGILL, SignalExceptionHandler);
    signal(SIGSEGV, SignalExceptionHandler);
    signal(SIGFPE, SignalExceptionHandler);
    signal(SIGBUS, SignalExceptionHandler);
    signal(SIGPIPE, SignalExceptionHandler);
    
}

void SignalExceptionHandler(int signal) {
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, frames);
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for (int i = 0; i < frames; i++) {
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
    //存储crash信息。
}

void HandleNSException(NSException *exception) {
    __unused NSString *reason = [exception reason];
    __unused NSString *name = [exception name];
    //存储crash信息。
}

@end
