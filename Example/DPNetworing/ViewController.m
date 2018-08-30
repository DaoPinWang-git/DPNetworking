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
    
    // 单例
    /************** 以下只是举例，请根据自身需要配置 **************/
    // 通用网络请求设置
    DPNetConfig *config = [DPNetConfig sharedManager];

    // 设置baseRUL
    config.baseURL = @"http://api.xxxx.com/app/";
    
    // 设置通用的头部信息
    config.HTTPHeaderDic = @{@"token" : @"xxxxxxxx", @"versions" : @"1.0.0"};
    
    // 设置返回格式
    config.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", @"text/jaon" ,@"text/javascript",@"text/html", nil];
    
    // 设置通用的请求失败处理
    config.failureBlock = ^BOOL(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *e = (NSError*)error;
        NSData *errorData = e.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        if (errorData) {
            NSDictionary *serializedData = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
            // 如判断token是否失效
            if ([serializedData[@"code"] integerValue] == 1010) {
                NSLog(@"token 失效");
                return NO;
            }
            NSLog(@"\n error:%@ \n ******************** \n URL:%@",serializedData, error.userInfo[@"NSErrorFailingURLKey"]);
        }
        return YES;
    };
    
    /******************************************************/

    
    [DPNetworking get:@"xxxx"
               handle:^(DPNetworking * _Nonnull handle) {
                   // 如果对本次请求需要什么特殊设置，可以再此处设置
                   handle.requestSerializer.timeoutInterval = 15.f;
                   [handle.requestSerializer setValue:@"1" forHTTPHeaderField:@"status"];
               }
           parameters:@{@"key" : @"value"}
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
