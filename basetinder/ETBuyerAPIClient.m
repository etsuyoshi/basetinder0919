//
//  ETBuyerAPIClient.m
//  CollectionViewTest
//
//  Created by EndoTsuyoshi on 2014/07/26.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "ETBuyerAPIClient.h"
#import "ETDefaultInfo.h"

@implementation ETBuyerAPIClient

+ (instancetype)sharedClient
{
    static ETBuyerAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    NSString * const kBSAPIBaseURLString = [ETDefaultInfo setApiUrl];
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.HTTPAdditionalHeaders = @{
                                                @"Accept" : @"application/json",
                                                };
        
        _sharedClient = [[ETBuyerAPIClient alloc]
                         initWithBaseURL:[NSURL URLWithString:kBSAPIBaseURLString]
                         sessionConfiguration:configuration];
    });
    
    return _sharedClient;
}

//+(instancetype)sharedHibitaClient{
//    static ETBuyerAPIClient *_sharedClient = nil;
//    static dispatch_once_t onceToken;
//    NSString * const kBSAPIBaseURLString = [ETDefaultInfo setHibitaApiUrl];
//    dispatch_once(&onceToken, ^{
//        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        configuration.HTTPAdditionalHeaders = @{
//                                                @"Accept" : @"application/json",
//                                                };
//        
//        _sharedClient = [[ETBuyerAPIClient alloc]
//                         initWithBaseURL:[NSURL URLWithString:kBSAPIBaseURLString]
//                         sessionConfiguration:configuration];
//    });
//    
//    return _sharedClient;
//}



//キュレーション内の全てのデータを取得
- (void)getAllCurationsItemsWithNum:(NSString *)num
                         completion:(void (^)(NSDictionary *,
                                              NSURLSessionDataTask *,
                                              NSError *))block
{
    
    if([num isEqual:[NSNull null]] ||
       num == nil){
        
        NSLog(@"return : caz num=%@", num);
        return;
    }
    
    
    [self GET:@"/curations/get_items"
   parameters:@{
                @"num": num,
                }
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSLog(@"success : getAllCurationsItemsWithNum");
          if (block) block(responseObject, task, nil);
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
          NSLog(@"failure : getAllCurationsItemsWithNum");
          //呼出し側で401判定をしてセッションの有効性を確認する
//          if (block) block(nil, task, error);
          
          
          // 401 が返ったときログインが必要.
          if (((NSHTTPURLResponse *)task.response).statusCode == 401) {
              if (block) block(nil, task, nil);
          }
          else {
              if (block) block(nil, task, error);
          }
      }];
}

- (void)getShopItemWithItemId:(NSString *)itemId
                   deviseName:(NSString *)deviseName
                     deviseOS:(NSString *)deviseOS
                     deviseId:(NSString *)deviseId
                   completion:(void (^)(NSDictionary *, NSError *))block
{
    
    [self GET:@"/shops/get_item"
   parameters:@{
                @"item_id"              : itemId,
                //@"device_name"          : deviseName,
                //@"device_os"            : deviseOS,
                //;@"device_id"            : deviseId,
                
                }
      success:^(NSURLSessionDataTask *task, id responseObject) {
          if (block) block(responseObject, nil);
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
          // 401 が返ったときログインが必要.
          if (((NSHTTPURLResponse *)task.response).statusCode == 401) {
              if (block) block(nil, nil);
          }
          else {
              if (block) block(nil, error);
          }
      }];
}



@end
