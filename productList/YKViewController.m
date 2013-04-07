//
//  YKViewController.m
//  productList
//
//  Created by  YK on 13-4-7.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKViewController.h"
#import "YKProductListView.h"
@interface YKViewController ()
@property (strong,nonatomic) YKProductListView *listView;
@end

@implementation YKViewController


- (NSInteger)numberOfItems{
    return 10;
}
- (ProductListType)productListType{
    return ProductListTypeSingle;
}

- (NSString *)imageUrlForIndex:(int)_index{
    return @"moo.png";
}
- (NSString *)productNameForIndex:(int)_index{
    return @"男装";
}
- (NSString *)salePriceForIndwx:(int)_index{
    return @"88.8";
}
- (NSString *)shopPriceForIndex:(int)_index{
    return @"99.9";
}
- (UIView*)cellViewModel{
    return [[YKProductCellView alloc] initWithFrame:CGRectMake(0, 0, 160, 130) salePrice:@"Y12.5" shopPrice:nil productName:@"户外运动。。。" imageUrl:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"viewC";
    self.listView = [[YKProductListView alloc] initWithFrame:CGRectMake(0, 0, 320, 460-46)];
    _listView.dataSource = self;
   [self.view addSubview:_listView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
