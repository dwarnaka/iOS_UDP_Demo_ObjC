//
//  ViewController.m
//  UdpDemo
//
//  Created by dwarnaka on 10/21/19.
//  Copyright © 2019 dwarnaka. All rights reserved.
//

#include "CoreFoundation_UDP.h"
#include "POSIX_UDP.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CoreFoundation_UDP* cfudp = [[CoreFoundation_UDP alloc] init];
    
    [cfudp testUdpSocket];
}

@end
