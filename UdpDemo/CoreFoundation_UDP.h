//
//  CoreFoundation_UDP.h
//  UdpDemo
//
//  Created by dwarnaka on 10/21/19.
//  Copyright © 2019 dwarnaka. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <arpa/inet.h>
#import <CoreFoundation/CFSocket.h>
#include <sys/socket.h>
#include <netinet/in.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreFoundation_UDP : NSObject

-(void) testUdpSocket;

@end

NS_ASSUME_NONNULL_END
