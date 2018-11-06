#import <Foundation/Foundation.h>
#include <iostream>
#include <iterator>
#include <cstdlib>
#import "lib/request.h"
#import "lib/response.h"

// #include <cstdio>

using namespace std;
 
int main(int argc, char* argv[]) {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    // NSDictionary* headers = @{
    //     @"Content-Type: "
    // };
    Response *resp = [[Response alloc] init];
    resp.name = @"Hello1233123";
    // Request *req = [[Request alloc] init];

    // NSString *body = [req getBody];

    // NSMutableDictionary *search = req->search;
    // NSString *name = [search valueForKey: @"name"];
    // NSString *name = [NSString stringWithFormat: @"%@", search];

    // if (getenv("REQUEST_METHOD"))
    
    cout << "Content-Type: text/html\r\n\r\n"
        << "<html>"
        << "<head>"
        << "<meta charset=\"utf-8\"/>"
        << "</head>"
        << "<body>"
        // << resp->name.UTF8String
        << "<br/>"
        << resp.name.UTF8String
        << "</body>"
        << "</html>"
        << endl;
    
    [pool drain];
    return 0;
}