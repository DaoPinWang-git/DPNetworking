//
//  ViewController.m
//  DPNetworing
//
//  Created by dpwong on 2018/1/18.
//  Copyright © 2018年 dpwong. All rights reserved.
//

#import "ViewController.h"
#import "DPNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 单例，只需要在设置一次
    DPNetConfig *config = [DPNetConfig sharedManager];

    config.baseURL = @"http://api.moiiee.com:9097/app/";
    config.HTTPHeaderDic = @{@"token" : @"xxxxxxxx", @"v" : @"1.0.1"};
    config.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", @"text/jaon" ,@"text/javascript",@"text/html", nil];
    
    
    config.failureBlock = ^BOOL(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *e = (NSError*)error;
        NSData *errorData = e.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        if (errorData) {
            NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
            if ([serializedData[@"code"] integerValue] == 1010) {
                NSLog(@"token 失效");
                return NO;
            }
            NSLog(@"\n error:%@ \n ******************** \n URL:%@",serializedData, error.userInfo[@"NSErrorFailingURLKey"]);
        }
        return YES;
    };
    
    [DPNetworking get:@"brands/recommended_brands"
               handle:^(DPNetworking * _Nonnull handle) {
                   handle.requestSerializer.timeoutInterval = 15.f;
                   [handle.requestSerializer setValue:@"1" forHTTPHeaderField:@"status"];
               }
           parameters:nil
              success:^(id responseObject) {
                  
              }
              failure:^(id error) {
                  
              }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
