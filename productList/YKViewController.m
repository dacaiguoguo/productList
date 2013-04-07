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

- (void)productListView:(YKProductListView *)productListView didSelectIndex:(int)_row{
    NSLog(@"ss:%d",_row);
}
- (NSInteger)numberOfItems{
    return 11;
}
- (YKProductListType)productListType{
    return _type;
}

- (NSString *)imageUrlForIndex:(int)_index{
    return @"foo.png";
}
- (NSString *)productNameForIndex:(int)_index{
    return [NSString stringWithFormat:@"%d男装男装男装",_index];;
}
- (NSString *)salePriceForIndex:(int)_index{
    return [NSString stringWithFormat:@"%d88.8",_index];
}
- (NSString *)shopPriceForIndex:(int)_index{
    return [NSString stringWithFormat:@"%d99.8",_index];;
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
