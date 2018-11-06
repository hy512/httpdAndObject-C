

#import <Foundation/Foundation.h>

@interface Request : NSObject {
    NSMutableDictionary *search;
    NSString *method;
    NSMutableDictionary *headers;
}
-(id) init;
@end