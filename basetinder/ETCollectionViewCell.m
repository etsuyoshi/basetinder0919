//
//  ETCollectionViewCell.m
//  CollectionViewTest
//
//  Created by EndoTsuyoshi on 2014/07/24.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "ETCollectionViewCell.h"

@implementation ETCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
//        [self setup];
    }
    
    return self;
}

-(void)setup{
    
//    self.numberLabel.textColor = [UIColor whiteColor];
//    self.captionLabel.textColor = [UIColor whiteColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
