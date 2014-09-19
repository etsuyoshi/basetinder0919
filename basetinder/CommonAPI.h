//
//  CommonAPI.h
//  JSQMessages
//
//  Created by EndoTsuyoshi on 2014/08/17.
//  Copyright (c) 2014年 Hexed Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonAPI : NSObject


+(NSData *)getKeyChainStore:(NSString *)strService withKey:(NSString *)strKey;
+(BOOL)addStrId:(NSString *)strId
        Service:(NSString *)strService
        withKey:(NSString *)strKey;

+(void)setIdArray:(NSArray *)arrayInput
      withService:(NSString *)strService
          withKey:(NSString *)strKey;


//+(void)setIdArray:(NSArray *)arrayInput;
//+(NSArray *)getIdArray;
//+(BOOL)addId:(NSString *)strId;
//+(NSArray *)initArrayGroupId;
@end
