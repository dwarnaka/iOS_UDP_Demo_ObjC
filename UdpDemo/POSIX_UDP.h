//
//  POSIX_UDP.h
//  UdpDemo
//
//  Created by dwarnaka on 10/21/19.
//  Copyright © 2019 dwarnaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <unistd.h>
#include <arpa/inet.h>

NS_ASSUME_NONNULL_BEGIN

@interface POSIX_UDP : NSObject

- (void)broadCast;

@end

NS_ASSUME_NONNULL_END
