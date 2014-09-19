//
//  ViewController.h
//  basetinder
//
//  Created by EndoTsuyoshi on 2014/09/16.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HonbanViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "REMenu.h"
#import "FavoriteViewController.h"


@interface ViewController : UIViewController<MDCSwipeToChooseDelegate>
@property (strong, readonly, nonatomic) REMenu *topMenu;

@end

