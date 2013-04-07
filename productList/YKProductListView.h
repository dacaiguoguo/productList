//
//  YKProductListView.h
//  productList
//
//  Created by  YK on 13-4-7.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum YKProductListType : NSInteger{
    YKProductListTypeTwo = 2,
    YKProductListTypeSingle = 1,
}YKProductListType;


@interface YKProductViewCellSingle :UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *salePriceLabel;

@end

@interface YKProductViewCellTwo :UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftSalePriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightSalePriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@class YKProductListView;
/**
    @protocol YKProductListViewDataSource
    @decription data source 按Single 模式提供。
 */
@protocol YKProductListViewDataSource<NSObject>
- (NSString *)imageUrlForIndex:(int )_index;
- (NSString *)salePriceForIndex:(int)_index;
- (NSString *)shopPriceForIndex:(int)_index;
- (NSString *)productNameForIndex:(int)_index;
- (NSInteger)numberOfItems;
- (YKProductListType)productListType;
@end
@protocol YKProductListViewDelegate <NSObject>
/**
    点击了第几个，注意不是第几行
 */
- (void)productListView:(YKProductListView*)productListView didSelectIndex:(int)_row;

@end

@interface YKProductListView : UIView
@property (weak, nonatomic) id<YKProductListViewDataSource> dataSource;
@property (weak, nonatomic) id<YKProductListViewDelegate> delegate;
-(void) reloadData;
@end
