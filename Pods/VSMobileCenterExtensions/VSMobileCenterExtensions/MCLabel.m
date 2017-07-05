
#import <XCTest/XCTest.h>
#import "MCLabel.h"

/*
 This label prefix signifies to the event processor that this particular log
 statement is intended to be treated as a label.
 */
const NSString *LABEL_PREFIX = @"[MobileCenterTest]: ";

/*
  We need some references to private API methods, so we'll declare them here.
 */
@interface XCAXClient_iOS : NSObject
+ (XCAXClient_iOS *)sharedClient;
- (NSData *)screenshotData;
@end

@interface XCActivityRecord : NSObject
@property (copy) NSData *screenImageData;
@property (copy) NSString *title;
@end

@interface _XCTestCaseImplementation : NSObject
@property(retain, nonatomic) NSMutableArray <XCActivityRecord *> *activityRecordStack;
@end

typedef void (^activityBlock)(XCActivityRecord *activityRecord);

@interface XCTestCase (MCTAccess)
@property(retain) _XCTestCaseImplementation *internalImplementation;
- (void)startActivityWithTitle:(NSString *)title block:(activityBlock)block;
@end

XCTestCase *_XCTCurrentTestCase();
void _XCINFLog(NSString *msg);

@implementation MCLabel

+ (void)label:(NSString *)fmt, ... {
    va_list args;
    va_start(args, fmt);
    [self labelStep:fmt args:args];
    va_end(args);
}

+ (XCTestCase *)currentTestCase {
    return _XCTCurrentTestCase();
}

+ (void)labelStep:(NSString *)msg {
    [self _label:msg];
}

+ (void)labelStep:(NSString *)fmt args:(va_list)args {
    NSString *lbl = [[NSString alloc] initWithFormat:fmt arguments:args];
    [self _label:lbl];
}

/*
    We add in the prefix and pass it along to XCTest
 */
+ (void)_label:(NSString *)message {
    XCTestCase *testCase = [self currentTestCase];
    if (testCase == nil) {
        [self labelFailedWithError:@"Unable to locate current test case."
                      labelMessage:message];
    } else {
        /*
            Declare that we are starting an activity, titled with the user's label.
            This activity merely captures a screenshot, which is then processed
            by MobileCenter/XTC.
         */
        [testCase startActivityWithTitle:[NSString stringWithFormat:@"%@%@", LABEL_PREFIX, message]
                                   block:^(XCActivityRecord *activityRecord){
            if (activityRecord == nil) {
                [self labelFailedWithError:@"No XCActivityRecord currently exists."
                              labelMessage:message];
            } else {
                XCAXClient_iOS *client = [XCAXClient_iOS sharedClient];
                if (client == nil) {
                    [self labelFailedWithError:@"Unable to fetch Accessibility Client." labelMessage:message];
                } else {
                    NSData *screenshotData = [client screenshotData];
                    if (screenshotData == nil) {
                        [self labelFailedWithError:@"Unable to fetch screenshot data from Accessibility Client."
                                      labelMessage:message];
                    } else {
                        [activityRecord setScreenImageData:screenshotData];
                    }
                }
            }
        }];
    }
}

+ (void)labelFailedWithError:(NSString *)errorMessage labelMessage:(NSString *)labelMessage {
    /*
     These will appear in the Device Log.
     */
    NSLog(@"%@ERROR: %@", LABEL_PREFIX, errorMessage);
    NSLog(@"%@ERROR: Unable to process label(\"%@\")", LABEL_PREFIX, labelMessage);

    /*
     These will appear in the Debug Log of the test run.
     */
    _XCINFLog([NSString stringWithFormat:@"%@ERROR: %@", LABEL_PREFIX, errorMessage]);
    _XCINFLog([NSString stringWithFormat:@"%@ERROR: Unable to process label(\"%@\")", LABEL_PREFIX, labelMessage]);
}


@end
