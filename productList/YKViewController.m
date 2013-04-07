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
@property (assign) YKProductListType type;
@end

@implementation YKViewController


- (NSInteger)numberOfItems{
    return 10;
}
- (YKProductListType)productListType{
    return _type;
}

- (NSString *)imageUrlForIndex:(int)_index{
    return @"moo.png";
}
- (NSString *)productNameForIndex:(int)_index{
    return @"男装";
}
- (NSString *)salePriceForIndex:(int)_index{
    return @"88.8";
}
- (NSString *)shopPriceForIndex:(int)_index{
    return @"99.9";
}

- (void)reloadView{
    if (_type==YKProductListTypeSingle) {
        _type=YKProductListTypeTwo;
    }else{
        _type = YKProductListTypeSingle;
    }
    [self.listView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _type = YKProductListTypeSingle;
    self.title = @"viewC";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(reloadView)];
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
