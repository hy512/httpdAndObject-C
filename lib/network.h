
#ifndef __SOCKET_H__
#define __SOCKET_H__
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/shm.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <iostream>
#endif

using namespace std;

namespace X {
    class Network {
        
    };

    class HttpRequest {
        public:
            void setHeader(string field, string value);
    };

    void run() {
        
    }
}