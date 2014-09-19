//
//  ETCollectionViewCell.h
//  CollectionViewTest
//
//  Created by EndoTsuyoshi on 2014/07/24.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;

@end
