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
    
    // NSURLSessionConfiguration *conf = NSURLSessionConfiguration.defaultSessionConfiguration;
    // NSURLSession *session = [NSURLSession sessionWithConfiguration: conf];
    // NSURLSession *session = NSURLSession.sharedSession;
    // NSURLSessionTask *task = [session downloadTaskWithUrl: [NSURL URLWithString: @"https://cn.bing.com/az/hprichbg/rb/ManateeAwareness_ZH-CN7743165279_1920x1080.jpg"
        // completionHandler: ^(NSURL *location, NSURLResponse *response, NSError *error) {
            cout << "Content-Type: text/html\r\n\r\n"
                << "<html>"
                << "<head>"
                << "<meta charset=\"utf-8\"/>"
                << "</head>"
                << "<body>"
                // << resp->name.UTF8String
                << "<br/>"
                // << resp.name.UTF8String
                // << location.absoluteString.UTF8String
                << "</body>"
                << "</html>"
                << endl;
        // }]];


    // NSString *body = [NSString stringWithFormat: @"home: %@, user: %@", NSHomeDirectory(), NSUserName()];
    // NSFileManager *mgr = NSFileManager.defaultManager;
    // NSURL *url = [mgr homeDirectoryForUser: @"httpd"];
    // NSURL *url = [NSURL fileURLWithPath:@"/home/silence/Desktop/httpdAndObject-C/index.cgi"];
    // NSURL *url1 = [NSURL URLWithString: @"file://home/silence/Desktop/trash" relativeToURL: url];
    // NSString *body = url1.absoluteString;
    
    
    [pool drain];
    return 0;
}