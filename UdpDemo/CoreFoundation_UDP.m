//
//  CoreFoundation_UDP.m
//  UdpDemo
//
//  Created by dwarnaka on 10/21/19.
//  Copyright © 2019 dwarnaka. All rights reserved.
//

#import "CoreFoundation_UDP.h"

@implementation CoreFoundation_UDP

static int receivedByteCount = 0;
void onReceive(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info);
void onReceive(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info) {
    // this gets called once, but CFDataGetLength(data) == 0
    receivedByteCount += CFDataGetLength(data);
}

-(void) testUdpSocket {
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_len = sizeof(addr);
    addr.sin_family = AF_INET;
    addr.sin_port = htons(55555); // socket to transmit on
    inet_pton(AF_INET, "127.0.0.1", &addr.sin_addr); //address to transmit to
    CFSocketContext socketContext = { 0, (__bridge void*)self, CFRetain, CFRelease, NULL };

    // prepare receiver
    //CFSocketRef receiver = CFSocketCreate(kCFAllocatorDefault, PF_INET, SOCK_DGRAM, IPPROTO_UDP ,kCFSocketDataCallBack, (CFSocketCallBack)onReceive, &socketContext);
    //CFSocketConnectToAddress(receiver, CFDataCreate(NULL, (unsigned char *)&addr, sizeof(addr)), -1);

    // point sender at receiver
    CFSocketRef sender = CFSocketCreate(kCFAllocatorDefault, PF_INET, SOCK_DGRAM, IPPROTO_UDP, kCFSocketDataCallBack, (CFSocketCallBack)onReceive, &socketContext);
    CFSocketConnectToAddress(sender, CFDataCreate(NULL, (unsigned char *)&addr, sizeof(addr)), -1);

    // send data of sixty zeroes, allow processing to occur
    NSString * myString = @"My string data"; // data being transmitted
    
    //data conversion
    CFDataRef myDataRef = (__bridge CFDataRef)[myString dataUsingEncoding:NSASCIIStringEncoding];
    
    //transmit data
    CFSocketSendData(sender, NULL, myDataRef, 2.0);
    // did the data arrive?
    //STAssertTrue(receivedByteCount > 0, @"");
    // nope
}

@end
