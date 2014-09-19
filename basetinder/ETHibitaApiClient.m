//
//  ETHibitaApiClient.m
//  basetinder
//
//  Created by EndoTsuyoshi on 2014/09/19.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "ETHibitaApiClient.h"
#import "ETDefaultInfo.h"

@implementation ETHibitaApiClient

+(instancetype)sharedClient{
    static ETHibitaApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    NSString * const kBSAPIBaseURLString =
    [ETDefaultInfo setHibitaApiUrl];
//    @"http://api.thebase.in";
    //[ETDefaultInfo setHibitaApiUrl];
    NSLog(@"kBSAPIBaseURLString = %@", kBSAPIBaseURLString);
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.HTTPAdditionalHeaders = @{
                                                @"Accept" : @"application/json",
                                                };
        
        _sharedClient = [[ETHibitaApiClient alloc]
                         initWithBaseURL:[NSURL URLWithString:kBSAPIBaseURLString]
                         sessionConfiguration:configuration];
    });
    
    return _sharedClient;
}



//キュレーション内の全てのデータを取得
- (void)getitemsWithCompletion:(void (^)(NSDictionary *,
                                         NSURLSessionDataTask *,
                                         NSError *))block
{
    
    
    [self getitemsWithTerm:@"テスト"
                Completion:block];
}

- (void)getitemsWithTerm:(NSString *)strTerm
              Completion:(void (^)(NSDictionary *,
                                 NSURLSessionDataTask *,
                                 NSError *))block
{
    
    NSLog(@"hibitan");
    if([strTerm isEqual:[NSNull null]] ||
       strTerm == nil){
        NSLog(@"検索ワードが無効です");
        return;
    }
//    if([num isEqual:[NSNull null]] ||
//       num == nil){
//        
//        NSLog(@"return : caz num=%@", num);
//        return;
//    }
//    NSDictionary *parameters = [NSMutableDictionary dictionary];
    
    [self GET:@"/1/search"
//     parameters:parameters
   parameters:@{
//                @"num": num,
                @"q":strTerm,   
                @"client_id":@"e61085c610b971fc55376fdda8368893",
                }
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSLog(@"success : %@", responseObject);
          if (block) block(responseObject, task, nil);
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
          NSLog(@"failure : %@", error);
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

//- (void)getShopItemWithItemId:(NSString *)itemId
//                   deviseName:(NSString *)deviseName
//                     deviseOS:(NSString *)deviseOS
//                     deviseId:(NSString *)deviseId
//                   completion:(void (^)(NSDictionary *, NSError *))block
//{
//    
//    [self GET:@"/shops/get_item"
//   parameters:@{
//                @"item_id"              : itemId,
//                //@"device_name"          : deviseName,
//                //@"device_os"            : deviseOS,
//                //;@"device_id"            : deviseId,
//                
//                }
//      success:^(NSURLSessionDataTask *task, id responseObject) {
//          if (block) block(responseObject, nil);
//      }
//      failure:^(NSURLSessionDataTask *task, NSError *error) {
//          // 401 が返ったときログインが必要.
//          if (((NSHTTPURLResponse *)task.response).statusCode == 401) {
//              if (block) block(nil, nil);
//          }
//          else {
//              if (block) block(nil, error);
//          }
//      }];
//}





@end
