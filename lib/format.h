#import <Foundation/Foundation.h>

@interface Format : NSObject

+(NSString *) parseJSON: (NSString *)jsonStr;
+(id) parse: (NSString *) str type:(NSString *) type;
@end