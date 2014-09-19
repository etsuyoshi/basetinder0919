//
//  HonbanViewController.m
//  basetinder
//
//  Created by EndoTsuyoshi on 2014/09/19.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "HonbanViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "ETBuyerAPIClient.h"
#import "ETHibitaApiClient.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface HonbanViewController ()

@end

@implementation HonbanViewController{
    MDCSwipeToChooseViewOptions *options;
    
    NSMutableArray *arrTmpImageUrl;
    
    NSArray *arrHibitaItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"本番環境";
    self.view.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5f];
    
    
    
    options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Fine";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"dislike";
    options.onPan = ^(MDCPanState *state){
        if(state.thresholdRatio == 1.f &&
           state.direction == MDCSwipeDirectionLeft){
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    arrTmpImageUrl = [NSMutableArray arrayWithObjects:
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/12bea6b0b07aa44970929fb1e4f7bd33.jpg",
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/0ef975e74d79bb220a0d05bc9b369560.jpg",
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/e1d3a5cf4db8e82e5766374cf6345558.jpg",
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/bdebcfe56c0433f240ac55617eebb768.jpg",
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/d45097a0e410059df77ae6553e05f9d6.jpg",
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/f248aaee5cb5c2217b590b0c688851ae.jpg",
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/5dd03e9cb802c7647724fd1e804fa9ea.jpg",
                      @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/sp/480/56e8d148493ef638d2966dc77a0cba5d.jpg",
                      nil];
    
    
    //データ取得
    [[ETBuyerAPIClient sharedClient]
     getAllCurationsItemsWithNum:@"50"
     completion:^(NSDictionary *results,
                  NSURLSessionDataTask *task ,
                  NSError *error) {
         
         NSLog(@"results = %@", results);
         
         int cate = 0;
         NSString *strBaseImageUrl = results[@"image_url"];
         NSString *strEachImageUrl = nil;
         for(int i = 0;i < ((NSArray *)results[@"result"][@"Category"][cate][@"Shop"]).count;i++){
             strEachImageUrl = results[@"result"][@"Category"][cate][@"Shop"][i][@"Item"][@"image"];
             [arrTmpImageUrl addObject:[NSString stringWithFormat:@"%@%@",strBaseImageUrl,strEachImageUrl]];
             NSLog(@"arrTmpImageUrl %d = %@", i, [NSString stringWithFormat:@"%@%@",strBaseImageUrl,strEachImageUrl]);
         }
         
         
     }];
    
    [[ETHibitaApiClient sharedClient]
     getitemsWithCompletion:^(NSDictionary *results,
                              NSURLSessionDataTask *task,
                              NSError *error){
         
         NSLog(@"hibita = %@", results);
         
         NSString *strFound = results[@"found"];
         NSArray *arrItems = results[@"items"];
         //         NSLog(@"strFound = %@, dictItems = %@", strFound, dictItems);
         
         arrHibitaItems = arrItems;
         
         
         for(int i  = 0;i < arrItems.count;i++){
             //             NSLog(@"i - %d : %@", i, arrItems[i]);
             NSLog(@"categories = %@", arrItems[i][@"categories"]);
             NSLog(@"details = %@", arrItems[i][@"detail"]);
             NSLog(@"img1_146 = %@", arrItems[i][@"img1_146"]);
             NSLog(@"img1_300 = %@", arrItems[i][@"img1_300"]);
             NSLog(@"img1_500 = %@", arrItems[i][@"img1_500"]);
             NSLog(@"img1_640 = %@", arrItems[i][@"img1_640"]);
             NSLog(@"item_id = %@", arrItems[i][@"item_id"]);
             NSLog(@"modified = %@", arrItems[i][@"modified"]);
             NSLog(@"price = %@", arrItems[i][@"price"]);
             NSLog(@"shop_id = %@", arrItems[i][@"shop_id"]);
             NSLog(@"shop_name = %@", arrItems[i][@"shop_name"]);
             NSLog(@"shop_url = %@", arrItems[i][@"shop_url"]);
             NSLog(@"price = %@", arrItems[i][@"price"]);
             NSLog(@"stock = %@", arrItems[i][@"stock"]);
             NSLog(@"title = %@", arrItems[i][@"title"]);
         }
         
         //         NSArray *arrCategory = dictItems[@"categories"];
         //         NSDictionary *dictD = dictItems[@"detail"];
         
         
         
         
         
         //         NSLog(@"categ = %@, detail = %@", dictCategory, dictDetail);
         
         
     }];
    
    
    
    [self setSwipeImage];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    
}


-(void)setSwipeImage{
    
    
    
    for(int i = 0;i < 40;i++){
        MDCSwipeToChooseView *viewSwipe =
        [[MDCSwipeToChooseView alloc]
         initWithFrame:CGRectMake(0, 0, 300, 300)
         options:options];
        viewSwipe.center = self.view.center;
        //        view.imageView.image = [UIImage imageNamed:@"photo"];
        
        //画像データ取得
        NSString *strUrl =
        (NSString *)arrTmpImageUrl[i % arrTmpImageUrl.count];
        
        //        NSLog(@"noOfImage = %d : %@", noOfImage, strUrl);
        
        
        [viewSwipe.imageView
         setImageWithURL:[NSURL URLWithString:strUrl]
         placeholderImage:nil
         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType){
             [viewSwipe.imageView
              setImageWithURL:[NSURL URLWithString:strUrl]
              placeholderImage:image];
         }];
        
        
        
        
        [self.view addSubview:viewSwipe];
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
}


@end
