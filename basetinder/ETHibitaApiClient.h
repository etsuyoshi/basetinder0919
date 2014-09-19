//
//  ETHibitaApiClient.h
//  basetinder
//
//  Created by EndoTsuyoshi on 2014/09/19.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface ETHibitaApiClient : AFHTTPSessionManager



///---------------------------------------------------------------------------------------
/// @name インスタンスを得る
///---------------------------------------------------------------------------------------

+ (instancetype)sharedClient;




/** キュレーションアイテムの取得（全て）
 
 @param num 1キュレーションの最大商品数.                 // 必須ではない
 @param block 完了時に呼び出される blocks.
 */
//- (void)getItemsWithNum:(NSString *)num
//                         completion:(void (^)(NSDictionary *results,
//                                              NSURLSessionDataTask *task,
//                                              NSError *error))block;
- (void)getitemsWithCompletion:(void (^)(NSDictionary *,
                                         NSURLSessionDataTask *,
                                         NSError *))block;
- (void)getitemsWithTerm:(NSString *)strTerm
              Completion:(void (^)(NSDictionary *,
                                   NSURLSessionDataTask *,
                                   NSError *))block;

//- (void)getShopItemWithItemId:(NSString *)itemId
//                   deviseName:(NSString *)deviseName
//                     deviseOS:(NSString *)deviseOS
//                     deviseId:(NSString *)deviseId
//                   completion:(void (^)(NSDictionary *, NSError *))block;


@end
