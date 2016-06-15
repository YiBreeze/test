//
//  FTHttpTool.m
//  CommunityFinance
//
//  Created by FT on 15/8/20.
//  Copyright (c) 2015年 L. All rights reserved.
//

#import "FTHttpTool.h"
#import "AFNetworking.h"

@implementation FTHttpTool
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 1.创建请求管理对象
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        mgr.requestSerializer.timeoutInterval = 20.f;
        [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        // 2.发送请求
        [mgr POST:url parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              if (success) {
                  success(responseObject);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure) {
                  failure(error);
              }
          }];
    });
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 1.创建请求管理对象
        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        mgr.requestSerializer.timeoutInterval = 20.f;
        [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        // 2.发送请求
        [mgr GET:url parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             if (success) {
                 success(responseObject);
             }
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if (failure) {
                 failure(error);
             }
         }];
     });
}

@end
