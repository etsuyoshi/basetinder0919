//
//  ETDefaultDeviceInfo.m
//  CollectionViewTest
//
//  Created by EndoTsuyoshi on 2014/07/26.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "ETDefaultInfo.h"

@implementation ETDefaultInfo


+ (NSString*)setApiUrl{
    //本番環境x.x.x-prod-deploy
    return @"https://dt.thebase.in";
    
    //ステージング環境x.x.x-stg-deploy
//     return @"http://dt.base0.info";
    
    //テスト環境
//    return @"http://api.base0.info";
    
    //テスト環境x.x.x-dev-deploy
//    return @"http://api.n-base.info";
    
    //反社チェック用
    //return @"http://api.upbase.info";
    
}

+ (NSString*)setHibitaApiUrl{
    //本番環境x.x.x-prod-deploy
    return @"http://api.thebase.in";
}


@end
