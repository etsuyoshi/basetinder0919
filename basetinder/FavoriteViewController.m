//
//  ETFavoriteViewController.m
//  BASE3
//
//  Created by EndoTsuyoshi on 2014/09/18.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "FavoriteViewController.h"
#define CELL_SIZE 158
#define SIZE_ICON_CATEGORY 40

@interface FavoriteViewController ()

@end

@implementation FavoriteViewController{
    //    UITableView *favoriteTableView;
    UICollectionView *favoriteCollectionView;
    
    BOOL testBoolean;
    //    NSMutableArray *arrImgTopFeatureView;
    NSMutableArray *arrTmpImageUrl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    arrTmpImageUrl =
    [NSMutableArray arrayWithObjects:
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/12bea6b0b07aa44970929fb1e4f7bd33.jpg",
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/0ef975e74d79bb220a0d05bc9b369560.jpg",
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/e1d3a5cf4db8e82e5766374cf6345558.jpg",
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/bdebcfe56c0433f240ac55617eebb768.jpg",
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/d45097a0e410059df77ae6553e05f9d6.jpg",
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/f248aaee5cb5c2217b590b0c688851ae.jpg",
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/640/5dd03e9cb802c7647724fd1e804fa9ea.jpg",
     @"https://d2yhzwqe6ppdfh.cloudfront.net/images/item/sp/480/56e8d148493ef638d2966dc77a0cba5d.jpg",
     nil];
    
    //    favoriteTableView =
    //    [[UITableView alloc]initWithFrame:self.view.bounds
    //                                style:UITableViewStyleGrouped];
    //    favoriteTableView.delegate = self;
    //    favoriteTableView.dataSource = self;
    //
    //    [favoriteTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];//endoadd
    //
    //    [self.view addSubview:favoriteTableView];
    
    
    
    UICollectionViewFlowLayout *collectionViewFlowLayout =
    [[UICollectionViewFlowLayout alloc]init];
    collectionViewFlowLayout.itemSize = CGSizeMake(CELL_SIZE, CELL_SIZE);  //表示するアイテムのサイズ
    collectionViewFlowLayout.minimumLineSpacing = 1.0f;  //セクションとアイテムの間隔(縦空白幅)
    collectionViewFlowLayout.minimumInteritemSpacing = 1.0f;  //アイテム同士の間隔(横空白幅)
    int intervalOfSide = 1;
    collectionViewFlowLayout.sectionInset =
    UIEdgeInsetsMake(intervalOfSide, //top
                     intervalOfSide, //left
                     intervalOfSide, //bottom
                     intervalOfSide); //right
    
    
    
    
    
    
    favoriteCollectionView =
    [[UICollectionView alloc]
     initWithFrame:self.view.bounds
     collectionViewLayout:collectionViewFlowLayout];
    favoriteCollectionView.backgroundColor =
    [[UIColor greenColor] colorWithAlphaComponent:0.5f];
    
    favoriteCollectionView.delegate = self;
    favoriteCollectionView.dataSource = self;
    
    
    //コンテンツとしてカスタムセルを登録する
    UINib *nib = [UINib nibWithNibName:@"ETCollectionViewCell"
                                bundle:nil];
    [favoriteCollectionView
     registerNib:nib
     forCellWithReuseIdentifier:@"cellIdentifier"];
    //デフォルトセルを登録する
    [favoriteCollectionView
     registerClass:[UICollectionViewCell class]
     forCellWithReuseIdentifier:@"Cell"];
    
    
    //header登録する
    [favoriteCollectionView
     registerNib:[UINib nibWithNibName:@"ETFavoriteHeaderCollectionReusableView"//name of xib
                                bundle:nil]
     forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
     withReuseIdentifier:@"ETFavoriteHeaderCollectionReusableView"];//identifier of xib
    
    [self.view addSubview:favoriteCollectionView];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [favoriteCollectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSLog(@"number of sections in collection view");
    return 1;
}

//セクション毎のセル数を指定
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section{
    
    NSLog(@"number of ItemsInSection");
    if(section == 0){
        return 2500;
    }else{
        NSLog(@"error!");
        return 0;//
    }
}

//ヘッダーを入れる場合はこちら
//セクション毎にヘッダーの高さを指定
//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
//referenceSizeForHeaderInSection:(NSInteger)section{
//    NSLog(@"referenceSizeForHeaderInSection");
//    if(section == 0){
//        //header1、header2
//        return CGSizeMake(self.view.bounds.size.width, 300);
//
//    }else{
//        NSLog(@"error");
//        return CGSizeZero;
//    }
//}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        //アイテムのサイズ
        return CGSizeMake(CELL_SIZE, CELL_SIZE);
    }else{
        NSLog(@"error!");
        return CGSizeZero;
    }
}




-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    NSLog(@"cellForItemAtIndexPath");
    UICollectionViewCell *cell = nil;
    
    
    //セル番号50の倍数で
    if(indexPath.row % 50 == 0 && indexPath.row != 0){
        //データの読み込み
        if(testBoolean){//計測テスト
            //                dispatch_async(dispatch_get_main_queue(), ^{
            //非同期で実施した方が良い?->そんなに時間かからない
            [[ETBuyerAPIClient sharedClient]
             getAllCurationsItemsWithNum:@"50"
             completion:^(NSDictionary *results,
                          NSURLSessionDataTask *task ,
                          NSError *error) {
                 //             NSLog(@"results = %@", results);
                 
                 
                 NSLog(@"resultsのカテゴリの個数=%d", (int)((NSDictionary *)results[@"result"][@"Category"]).count);
                 
                 int cate = 0;
                 NSString *strBaseImageUrl = results[@"image_url"];
                 NSString *strEachImageUrl = nil;
                 for(int i = 0;i < ((NSArray *)results[@"result"][@"Category"][cate][@"Shop"]).count;i++){
                     strEachImageUrl = results[@"result"][@"Category"][cate][@"Shop"][i][@"Item"][@"image"];
                     //                     [arrTmpImageUrl addObject:[NSString stringWithFormat:@"%@%@",strBaseImageUrl,strEachImageUrl]];
                     NSLog(@"arrTmpImageUrl %d = %@", i, [NSString stringWithFormat:@"%@%@",strBaseImageUrl,strEachImageUrl]);
                 }
                 
                 
             }];//getAllCurationsItemWithNum
        }
        
        
    }else{
        //do nothing
    }
    
    
    
    if(indexPath.section == 0){
        cell =
        (ETCollectionViewCell *)
        [collectionView
         dequeueReusableCellWithReuseIdentifier:@"cellIdentifier"//viewDidLoadでnibに定義
         forIndexPath:indexPath];
        
        ((ETCollectionViewCell *)cell).mainImage.image = nil;
        
        cell.backgroundColor =
        [UIColor colorWithRed:(float)indexPath.row/255.5f green:0 blue:0 alpha:0.5f];
        
        ((ETCollectionViewCell *)cell).numberLabel.text =
        [NSString stringWithFormat:@"item%d",
         (int)indexPath.row];
        ((ETCollectionViewCell *)cell).captionLabel.text = @"explanation";
        ((ETCollectionViewCell *)cell).captionLabel.font = [UIFont systemFontOfSize:13.f];
        //        ((ETCollectionViewCell *)cell).mainImage.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.1f];
        
        //example
        //        NSString *strUrl =
        //         (NSString *)arrUrl[arc4random() % arrUrl.count];
        //        int noOfImage = arc4random() % arrTmpImageUrl.count;
        int noOfImage = (int)indexPath.row % arrTmpImageUrl.count;
        NSString *strUrl =
        (NSString *)arrTmpImageUrl[noOfImage];
        
        //        NSLog(@"noOfImage = %d : %@", noOfImage, strUrl);
        
        NSLog(@"start %3d %@", (int)indexPath.row, strUrl);
        
        [(UIImageView *)((ETCollectionViewCell *)cell).mainImage
         setImageWithURL:[NSURL URLWithString:strUrl]
         placeholderImage:nil
         completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType){
             NSLog(@"finish %3d", (int)indexPath.row);
             [((ETCollectionViewCell *)cell).mainImage
              setImageWithURL:[NSURL URLWithString:strUrl]
              placeholderImage:image];
         }];
        
        
        
    }
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    [[Crashlytics sharedInstance] crash];//意図的にクラッシュさせる場合
    
    NSLog(@"didSelect : %@", indexPath);
    
    //    ET2ViewController *vc = [[ET2ViewController alloc] init];
    //    [self.navigationController pushViewController:vc animated:false];
    
    
//    ETItemTableViewController *tvc = [[ETItemTableViewController alloc]init];
//    tvc.title = [NSString stringWithFormat:@"sec%d-row%d",
//                 (int)indexPath.section,
//                 (int)indexPath.row];
//    tvc.strItemId = @"734633";//仮置き
//    [self.navigationController pushViewController:tvc animated:YES];
}



//ヘッダーを表示する場合
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    //    UICollectionReusableView *reusableView;
    //
    //    if (kind == UICollectionElementKindSectionHeader) {
    //        ETFavoriteHeaderCollectionReusableView *headerView =
    //        [collectionView
    //         dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
    //         withReuseIdentifier:@"ETFavoriteHeaderCollectionReusableView"
    //         forIndexPath:indexPath];
    //
    //        headerView.imvInHeader.image =
    //         [UIImage imageNamed:@"a1.jpg"];
    //        headerView.lblInHeader.text = @"shop logo";
    //        headerView.lblInHeader.textColor = [UIColor grayColor];
    //        headerView.lblInHeader.textAlignment=NSTextAlignmentCenter;
    //        headerView.lblInHeader.font = [UIFont systemFontOfSize:50];
    //
    //
    //        reusableView = headerView;
    //    }
    //    if (kind == UICollectionElementKindSectionFooter) {
    //        ETFavoriteHeaderCollectionReusableView *footerview =
    //        [collectionView
    //         dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
    //         withReuseIdentifier:@"ETFavoriteHeaderCollectionReusableView"
    //         forIndexPath:indexPath];
    //
    //        reusableView = footerview;
    //    }
    //    
    //    
    //    return reusableView;
    
    return nil;
}



@end
