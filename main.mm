#import <Foundation/Foundation.h>
#include <iostream>
#include <cstdlib>
// #include <cstdio>

using namespace std;
 
int main(int argc, char* argv[]) {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    // NSDictionary* headers = @{
    //     @"Content-Type: "
    // };
    // getenv();
    NSString* body = [NSString stringWithContentsOfFile: @"/home/omitted/Desktop/httpdAndObject-C/index.html"
        encoding: NSUTF8StringEncoding
        error: NULL];
    cout << "Content-Type: text/html\r\n\r\n"
        << body.UTF8String
        << endl;
    
    [pool drain];
    return 0;
}