#import <Foundation/Foundation.h>

#import "request.h"
#import "format.h"

#include <cstdlib>
#include <iostream>
#include <iterator>
#include <string>

using std::cin;
using std::istream_iterator;
using std::string;

@interface Request() 
-(NSMutableDictionary *) parseSearch: (NSString *) searchStr ;
@end

@implementation Request

-(id) init {
    self = [super init];
    if (self != nil) {
        // 解析请求方法
        char *cmethod = getenv("REQUEST_METHOD");
        if (cmethod != NULL) {
            NSString *str = [NSString stringWithCString: cmethod
                encoding: NSUTF8StringEncoding];
            self->method = str.uppercaseString;
        }

        // 解析查询参数
        char *csearch = getenv("QUERY_STRING");
        if (csearch != NULL) {
            NSString *searchStr = [NSString stringWithCString: csearch
                encoding: NSUTF8StringEncoding];
            self->search = [self parseSearch: searchStr];
        } else {
            self->search = @"";
        }
        
        // 解析需要的请求头
        NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
        char *head = getenv("CONTENT_LENGTH");
        if (head != NULL) {
            [headers setObject: [NSString stringWithCString: head
                encoding: NSUTF8StringEncoding] forKey: @"Content-Length"];
        } else {
            [headers setObject: @"0" forKey: @"Content-Length"];
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

-(NSString *) getBody {
    // 得到 body 长度
    NSMutableDictionary *headers =  self->headers;
    NSString *lenStr = [headers valueForKey: @"Content-Length"];
    int length = 0;
    if (lenStr != nil) {
        length = lenStr.intValue;
    }
    // 读取 body
    istream_iterator<char> inStream(cin), eof;
    string body = "";
    int readLen = 0;
    while (inStream != eof && readLen < length) {
        body += *inStream++;
    }

    // 读取类型
    NSString *type = [headers valueForKey: @"Content-type"];
    return [Format parse: [NSString stringWithCString: body.c_str() 
            encoding:NSUTF8StringEncoding]
        type: type];
}

-(NSMutableDictionary *) parseSearch: (NSString *) searchStr {
    NSMutableDictionary* search = [[NSMutableDictionary alloc] init];
    
    // NSString* searchStr = [NSString stringWithCString: getenv("QUERY_STRING")
    //     encoding: NSUTF8StringEncoding];
    NSArray *argItems = [searchStr componentsSeparatedByString: @"&"];
    for (int i=0; i < argItems.count; i++ ){
        NSString *item = [argItems objectAtIndex: i];
        NSArray *entries = [item componentsSeparatedByString: @"="];
        if (entries.count == 2) {
            NSString *key = [entries objectAtIndex: 0];
            NSString *value = [entries objectAtIndex: 1];
            [search setObject:value forKey: key];
        }
    }
    
    return search;
}
@end