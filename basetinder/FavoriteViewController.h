//
//  ETFavoriteViewController.h
//  BASE3
//
//  Created by EndoTsuyoshi on 2014/09/18.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETCollectionViewCell.h"
#import "ETBuyerAPIClient.h"
#import <SDWebImage/UIImageView+WebCache.h>
//#import "ETItemTableViewController.h"
//#import "ETFavoriteHeaderCollectionReusableView.h"

@interface FavoriteViewController : UIViewController
<
//UITableViewDataSource
//, UITableViewDelegate
UICollectionViewDataSource
, UICollectionViewDelegate
>


@end
