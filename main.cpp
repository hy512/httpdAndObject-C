
// #include "lib/socket.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <netdb.h>
#include <string>
#include <cstring>
#include <iostream>

using namespace std;


int main (int argc, char *argv[]) {
    string req = "GET /az/hprichbg/rb/CupFungus_ZH-CN9348475069_1920x1080.jpg HTTP/1.1\r\n";
    // req += "Host: www.baidu.com\r\n";
    req += "Host: cn.bing.com\r\n";
    req += "Accept-Language: en-US,en;q=0.5\r\n";
    req += "\r\n";

    struct hostent *paradr =gethostbyname("en.bing.com");
    struct sockaddr_in seradr;
    seradr.sin_family = AF_INET;
    seradr.sin_port = htons(80);
    seradr.sin_addr = *((struct in_addr *)paradr ->h_addr);

    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (connect(sock, (struct sockaddr *)&seradr, sizeof(seradr)) != 0) {
        perror("connect");
        return 1;
    }

    char const *reqStr = req.c_str();
    send(sock, reqStr, strlen(reqStr), 0);
    char buf[1024];
    recv(sock, buf, 1024, 0);

    cout << buf << endl;
    close(sock);
    return 0;
}