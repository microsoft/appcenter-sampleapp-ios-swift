
#import <XCTest/XCTest.h>
#import "VSMobileCenterExtensions.h"

@interface MCLabelTests : XCTestCase

@end

@implementation MCLabelTests

/*
    Should compile and run without throwing
 */
- (void)testLabel {
    [MCLabel label:@"Test with no args"];
    label(@"Test with no args");
    
    [MCLabel label:@"Test with %@", @"args"];
    label(@"Test with %@", @"args");
}

@end
