#import <Foundation/Foundation.h>
#import "request.h"
#include <cstdlib>

@interface Request() 
-(NSMutableDictionary *) parseSearch: (NSString *) searchStr ;
@end

@implementation Request

-(id) init {
    self = [super init];
    if (self != nil) {
        // getenv("QUERY_STRING")
        char *cmethod = getenv("REQUEST_METHOD");
        if (cmethod != NULL) {
            NSString *str = [NSString stringWithCString: cmethod
                encoding: NSUTF8StringEncoding];
            self->method = str.uppercaseString;
        }

        char *csearch = getenv("QUERY_STRING");
        if (csearch != NULL) {
            NSString *searchStr = [NSString stringWithCString: csearch
                encoding: NSUTF8StringEncoding];
            self->search = [self parseSearch: searchStr];
        } else {
            self->search = @"";
        }
        

        NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
        char *head = getenv("CONTENT_LENGTH");
        if (head != NULL) {
            [headers setObject: [NSString stringWithCString: head
                encoding: NSUTF8StringEncoding] forKey: @"Content-Length"];
        }
        head = getenv("CONTENT_TYPE");
        if (head != NULL) {
            [headers setObject: [NSString stringWithCString: head
                encoding: NSUTF8StringEncoding] forKey: @"Content-Type"];
        }
        self->headers = headers;
    }
    return self;
}

-(NSMutableDictionary *) parseSearch: (NSString *) searchStr {
    NSMutableDictionary* search = [[NSMutableDictionary alloc] init];
    
    // NSString* searchStr = [NSString stringWithCString: getenv("QUERY_STRING")
    //     encoding: NSUTF8StringEncoding];
    NSArray* argItems = [searchStr componentsSeparatedByString: @"&"];
    for (int i=0; i < argItems.count; i++ ){
        NSString* item = [argItems objectAtIndex: i];
        NSArray* entries = [item componentsSeparatedByString: @"="];
        if (entries.count == 2) {
            NSString* key = [entries objectAtIndex: 0];
            NSString* value = [entries objectAtIndex: 1];
            [search setObject:value forKey: key];
        }
    }
    
    return search;
}
@end