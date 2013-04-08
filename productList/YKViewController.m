//
//  YKViewController.m
//  productList
//
//  Created by  yanguo.sun on 13-4-7.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKViewController.h"
#import "YKProductListView.h"
#import "YKBaseModel.h"

@interface YKViewController ()
@property (strong,nonatomic) YKProductListView *listView;
@property (assign) YKProductListType type;
@property (strong,nonatomic) YKProductList *listData;

@end

@implementation YKViewController
- (YKProductList*)listData{
    if (!_listData) {
        _listData = [[YKProductList alloc] init];
    }
    return _listData;

}
- (void)productListView:(YKProductListView *)productListView didSelectIndex:(int)_row{
    NSLog(@"ss:%d",_row);
}
- (NSInteger)numberOfItems{
    return self.listData.productList.count;
}
- (YKProductListType)productListType{
    return _type;
}

- (NSString *)imageUrlForIndex:(int)_index{
    return @"foo.png";
}
- (NSString *)productNameForIndex:(int)_index{
    YKProduct *product = self.listData.productList[_index];
    assert(product);
    return product.name;
}
- (NSString *)salePriceForIndex:(int)_index{
    YKProduct *product = self.listData.productList[_index];
    assert(product);

    return product.salePrice;
}
- (NSString *)shopPriceForIndex:(int)_index{
    YKProduct *product = self.listData.productList[_index];
    return product.marketprice;
}

- (void)reloadView{
    if (_type==YKProductListTypeSingle) {
        _type=YKProductListTypeTwo;
    }else{
        _type = YKProductListTypeSingle;
    }
    [self.listView reloadData];
}

- (void)setUpDatas{
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    for (int i=0; i<11; i++) {
        YKProduct *product = [[YKProduct alloc] init];
        int randN = rand()%1000;
        product.marketprice = [NSString stringWithFormat:@"%0.2f",randN*0.9];
        product.salePrice = [NSString stringWithFormat:@"%d",randN];

        product.name = [NSString stringWithFormat:@"%d男装男装男装",i];
        [mutArray addObject:product];
    }
    self.listData.productList = mutArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _type = YKProductListTypeSingle;
    [self setUpDatas];
    self.title = @"viewC";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(reloadView)];
    self.listView = [[YKProductListView alloc] initWithFrame:CGRectMake(0, 0, 320, 460-46)];
    _listView.dataSource = self;
    _listView.delegate = self;
   [self.view addSubview:_listView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
