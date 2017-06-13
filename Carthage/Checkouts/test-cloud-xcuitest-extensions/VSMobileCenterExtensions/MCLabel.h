
#import <Foundation/Foundation.h>

/*
    Use 
        [MCLabel label:fmt, ...]
    to mark a particular 'test step' in your test. This will also trigger a screenshot. 
 
    You can use `label(...)` as a convenience macro instead.
 */

@interface MCLabel : NSObject
+ (void)label:(NSString *)fmt, ...;


/*
    For swift compatibility
 */
+ (void)labelStep:(NSString *)msg;
+ (void)labelStep:(NSString *)fmt args:(va_list)args;
#define label(...) [MCLabel label: __VA_ARGS__]
@end
