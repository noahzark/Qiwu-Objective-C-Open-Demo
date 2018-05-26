//
//  ViewController.m
//  AFNetworkDemo
//
//  Created by MacMiniFirst on 25/05/2018.
//  Copyright © 2018 CentaursTech. All rights reserved.
//

#import "ViewController.h"
#import "RMQWNetWorkManager.h"
#import "NSDictionary+RMQW.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self p_networkWithQuestion:@"明天深圳出发飞往上海"];
    
}


//此处发一个post  请求试一下
- (void)p_networkWithQuestion:(NSString*)question {
    
    NSString *path = @"chat";
    NSMutableDictionary *parameters  = [NSMutableDictionary rmqw_requestBasicParameters];
    parameters[@"msg"] = question;
    NSLog(@"params::%@",parameters);
    
    [[RMQWNetWorkManager sharedManager] requestWithMethod:POST
                                                 withPath:path
                                               withParams:parameters
                                         withSuccessBlock:^(id response) {
                                             [self p_didWithResponse:response];
                                         }
                                         withFailureBlock:^(NSError *error) {
                                             [self p_didWithError:error];
                                         }];
    
    
    
}

- (void)p_didWithError:(NSError*)error {
    
    //网络请求返回的错误
    NSLog(@"网络请求返回的错误:%@",error);
}

- (void)p_didWithResponse:(id)response {
    
    NSLog(@"网络请求返回的数据:%@", response);
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
