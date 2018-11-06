#import <Foundation/Foundation.h>
#include <iostream>
#include <cstdlib>
#include "lib/request.h"
// #include <cstdio>

using namespace std;
 
int main(int argc, char* argv[]) {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    // NSDictionary* headers = @{
    //     @"Content-Type: "
    // };


    Request *req = [[Request alloc] init];

    NSMutableDictionary *search = req->search;
    // NSString *name = [search valueForKey: @"name"];
    NSString *name = [NSString stringWithFormat: @"%@", search];
    cout << "Content-Type: text/html\r\n\r\n"
        << "<html>"
        << "<head>"
        << "<meta charset=\"utf-8\"/>"
        << "</head>"
        << "<body>"
        << req->method.UTF8String
        << "<br/>"
        << name.UTF8String
        << "</body>"
        << "</html>"
        << endl;
    
    [pool drain];
    return 0;
}