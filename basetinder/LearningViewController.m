//
//  LearningViewController.m
//  basetinder
//
//  Created by EndoTsuyoshi on 2014/09/19.
//  Copyright (c) 2014年 in.thebase. All rights reserved.
//

#import "LearningViewController.h"
#import "UICKeyChainStore.h"
#import "ItemData.h"
@interface LearningViewController (){
//    NSArray *arrayCategories;
}

@end

@implementation LearningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UICKeyChainStore *store = [UICKeyChainStore keyChainStoreWithService:@"basetinder"];
//    NSData *dataReturn = [store dataForKey:@"arrSavedItem"];
//    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:dataReturn];
//    
//    NSLog(@"count = %d", array.count);
//    for(int i =0;i < array.count;i++){
//        NSLog(@"array %d = %@", i, array[i]);
//    }
//    self.arrayCategories = [NSArray arrayWithObjects:
//                       @"bag",
//                       @"wallet",
//                       @"desk",
//                       @"food",
//                       nil];
    
    
    NSArray *arrayColor = [NSArray arrayWithObjects:
                      [UIColor redColor],
                      [UIColor blueColor],
                      [UIColor yellowColor],
                      [UIColor greenColor],
//                      [UIColor purpleColor],
                      nil];
    int allCount = self.array.count;
    NSMutableArray *arrValue = [NSMutableArray array];
    for(int i =0;i < arrayColor.count;i++){
        float counter =(float)[self getCountWithId:self.arrayCategories[i]];
        float wariai = (float)counter/(float)allCount;
        [arrValue addObject:[NSString stringWithFormat:@"%f", wariai]];
    }
    for(int i = 0;i < arrValue.count;i++){
        NSLog(@"array = %@", arrValue[i]);
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50 + i * 30, 200, 20, [arrValue[i] floatValue] * 100)];
        view.backgroundColor = arrayColor[i % arrayColor.count];
        [self.view addSubview:view];
    }
    
//    UICKeyChainStore *store = [UICKeyChainStore keyChainStoreWithService:strService];
//
//    NSData *dataReturn = [store dataForKey:strKey];

}


//itemd.strCategories = arrHibitaCategories[view.tag];
//itemd.strImageUrl = arrHibitaImageUrl[view.tag];
//itemd.strItemId = arrHibitaItemId[view.tag];
-(int)getCountWithId:(NSString *)strKey{
    NSLog(@"strKey = %@", strKey);
    int sum = 0;
    for(int i = 0;i < self.array.count;i++){
        ItemData *itemd = (ItemData *)self.array[i];
        NSLog(@"match %d : %@", i, itemd.strCategories);
        if([itemd.strCategories isEqualToString:strKey]){
            sum++;
        }
    }
    
    return sum;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
