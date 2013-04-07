//
//  YKProductListView.h
//  productList
//
//  Created by  YK on 13-4-7.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import <UIKit/UIKit.h>
enum {	/* Constants returned by -operatingSystem */
    YKProductListTypeTwo = 2,
    YKProductListTypeSingle = 1,
};

typedef NSInteger YKProductListType;


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

@end
@protocol YKProductListViewDataSource<NSObject>
- (NSString *)imageUrlForIndex:(int )_index;
- (NSString *)salePriceForIndex:(int)_index;
- (NSString *)shopPriceForIndex:(int)_index;
- (NSString *)productNameForIndex:(int)_index;
- (NSInteger)numberOfItems;
- (YKProductListType)productListType;
@end


@interface YKProductListView : UIView
@property (weak, nonatomic) id<YKProductListViewDataSource> dataSource;
-(void) reloadData;
@end
