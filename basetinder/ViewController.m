//
//  ViewController.m
//  basetinder
//
//  Created by EndoTsuyoshi on 2014/09/16.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "ViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "ETBuyerAPIClient.h"
#import "ETHibitaApiClient.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "ItemData.h"

@interface ViewController ()
@property (strong, readwrite, nonatomic) REMenu *topMenu;

@end

@implementation ViewController{
    MDCSwipeToChooseViewOptions *options;
    
    NSMutableArray *arrTmpImageUrl;
    
    NSMutableArray *arrHibitaImageUrl;
    NSMutableArray *arrHibitaCategories;
    NSMutableArray *arrHibitaItemId;
    NSArray *arrayCategories;
    
    NSMutableArray *arrSavedItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.title = @"BASETINDER";
    
    options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"Fine";
    options.likedColor = [UIColor blueColor];
    options.nopeText = @"Delete";
    options.onPan = ^(MDCPanState *state){
        if(state.thresholdRatio == 1.f &&
           state.direction == MDCSwipeDirectionLeft){
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
//    dictSavedItem = [NSMutableDictionary dictionary];
    arrSavedItem = [NSMutableArray array];
    
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
//    [[ETBuyerAPIClient sharedClient]
//     getAllCurationsItemsWithNum:@"50"
//     completion:^(NSDictionary *results,
//                  NSURLSessionDataTask *task ,
//                  NSError *error) {
//         
//         NSLog(@"results = %@", results);
//         
//         int cate = 0;
//         NSString *strBaseImageUrl = results[@"image_url"];
//         NSString *strEachImageUrl = nil;
//         for(int i = 0;i < ((NSArray *)results[@"result"][@"Category"][cate][@"Shop"]).count;i++){
//             strEachImageUrl = results[@"result"][@"Category"][cate][@"Shop"][i][@"Item"][@"image"];
//             [arrTmpImageUrl addObject:[NSString stringWithFormat:@"%@%@",strBaseImageUrl,strEachImageUrl]];
//             NSLog(@"arrTmpImageUrl %d = %@", i, [NSString stringWithFormat:@"%@%@",strBaseImageUrl,strEachImageUrl]);
//         }
//         
//         
//     }];
    
    
    arrayCategories = [NSArray arrayWithObjects:
                                @"bag",
                                @"wallet",
                                @"desk",
                                @"white",
                                @"black",
                                @"food",
                                nil];
    arrHibitaImageUrl = [NSMutableArray array];
    arrHibitaCategories = [NSMutableArray array];
    arrHibitaItemId = [NSMutableArray array];
    
    //カテゴリ毎に全データを格納した後に全て表示
    [SVProgressHUD showWithStatus:@"データ取得中..."];
    
    [self setData:0];
    
    [self REMenuInitialize];
    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithTitle:@"Menu"
     style:UIBarButtonItemStyleDone
     target:self
     action:@selector(toggleTotalMenu)];
    
    
    
    
    
    
    
}

-(void)setData:(int)noCategories{
    
    
//    for(int j =0;j < arrayCategories.count;j++){
        [[ETHibitaApiClient sharedClient]
         getitemsWithTerm:arrayCategories[noCategories]
         Completion:^(NSDictionary *results,
                      NSURLSessionDataTask *task,
                      NSError *error){
             
             NSLog(@"hibita = %@", results);
             
             NSString *strFound = results[@"found"];
             NSLog(@"個数 : %@個のデータが見つかりました", strFound);
             NSArray *arrItems = results[@"items"];
             //         NSLog(@"strFound = %@, dictItems = %@", strFound, dictItems);
             
             //         arrHibitaItems = arrItems;
             
             
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
                 
                 if(![arrItems[i][@"img1_500"] isEqual:[NSNull null]] &&
                    arrItems[i][@"img1_500"] != nil){
                     [arrHibitaImageUrl addObject:arrItems[i][@"img1_500"]];//500pixel-image
                     [arrHibitaCategories addObject:arrayCategories[noCategories]];
                     [arrHibitaItemId addObject:arrItems[i][@"item_id"]];
                 }
             }
             
             //         NSArray *arrCategory = dictItems[@"categories"];
             //         NSDictionary *dictD = dictItems[@"detail"];
             
             
             
             
             
             //         NSLog(@"categ = %@, detail = %@", dictCategory, dictDetail);
             
             
             if(noCategories+1 < arrayCategories.count){
                 [self setData:noCategories+1];
             }else{
                 [self setSwipeImage];
                 
             }
             
         }];
        
//    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    
}


-(void)setSwipeImage{
    NSLog(@"setSwipeImage  %d, %d", arrHibitaItemId.count,
          arrHibitaImageUrl.count);
    

    for(int i = 0;i < arrHibitaItemId.count;i++){
        NSLog(@"i = %d : %@", i, arrHibitaImageUrl[i % arrHibitaImageUrl.count]);
        MDCSwipeToChooseView *viewSwipe =
        [[MDCSwipeToChooseView alloc]
         initWithFrame:CGRectMake(0, 0, 300, 300)
         options:options];
        viewSwipe.center = self.view.center;
        viewSwipe.tag = i;
        //        view.imageView.image = [UIImage imageNamed:@"photo"];
        
        //画像データ取得
        NSString *strUrl =
        arrHibitaImageUrl[i % arrHibitaImageUrl.count];
//        arrHibitaImageUrl[i % arrHibitaImageUrl.count][@"img1_500"];
        NSLog(@"strUrl = %@", strUrl);
        
//        (NSString *)arrTmpImageUrl[i % arrTmpImageUrl.count];
        
        //        NSLog(@"noOfImage = %d : %@", noOfImage, strUrl);
        
        
        [viewSwipe.imageView
         setImageWithURL:[NSURL URLWithString:strUrl]
         placeholderImage:nil
         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType){
             [viewSwipe.imageView
              setImageWithURL:[NSURL URLWithString:strUrl]
              placeholderImage:image];
             
             [SVProgressHUD dismiss];
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
        NSLog(@"Photo saved! %d", view.tag);
        
        
        ItemData *itemd = [[ItemData alloc]init];
        itemd.strCategories = arrHibitaCategories[view.tag];
        itemd.strImageUrl = arrHibitaImageUrl[view.tag];
        itemd.strItemId = arrHibitaItemId[view.tag];
        
        [arrSavedItem addObject:itemd];
        
    }
}
-(void)REMenuInitialize{
    REMenuItem *fanItem =
    [[REMenuItem alloc]
     initWithTitle:@"本番環境"
     subtitle:@"move to main page(アイコンは適当です)"
     image:[UIImage imageNamed:@"Icon_Profile"]
     highlightedImage:nil
     action:^(REMenuItem *item) {
         NSLog(@"Item: %@", item);
         
         //ファンページへ遷移
//         ETFanViewController *fanVC = [[ETFanViewController alloc]init];
//         [self.navigationController pushViewController:fanVC animated:YES];
         HonbanViewController *hvc = [[HonbanViewController alloc] init];
         [self.navigationController pushViewController:hvc animated:NO];
     }];
    
    REMenuItem *favoriteItem =
    [[REMenuItem alloc]
     initWithTitle:@"お気に入りページ"
     subtitle:@"go to favorite items page(アイコンは適当です)"
     image:[UIImage imageNamed:@"Icon_Activity"]
     highlightedImage:nil
     action:^(REMenuItem *item) {
         NSLog(@"Item: %@", item);
         
         FavoriteViewController *favoriteVC = [[FavoriteViewController alloc]init];
         [self.navigationController pushViewController:favoriteVC animated:YES];
     }];
    
    REMenuItem *settingItem =
    [[REMenuItem alloc]
     initWithTitle:@"学習状況"
     subtitle:@"アイコンは適当です"
     image:[UIImage imageNamed:@"Icon_Explore"]
     highlightedImage:nil
     action:^(REMenuItem *item) {
         NSLog(@"Item: %@", item);
         
         
         //設定アイテムを
         //         [self toggleSettingMenu];
         
         
     }];
    
    self.topMenu = [[REMenu alloc] initWithItems:@[fanItem, favoriteItem, settingItem]];
    //    [self.menu showFromNavigationController:self.navigationController];
    
}

- (void)toggleTotalMenu
{
    //トップメニューを閉じる
    if (self.topMenu.isOpen){
        return [self.topMenu close];
    }
    
    [self.topMenu showFromNavigationController:self.navigationController];
}


@end
