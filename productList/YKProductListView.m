//
//  YKProductListView.m
//  productList
//
//  Created by  yanguo.sun on 13-4-7.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKProductListView.h"
#import "YKXIBHelper.h"
#import <QuartzCore/QuartzCore.h>

@interface YKProductListView()<UITableViewDataSource,UITableViewDelegate>

@property (assign) CGRect orgFrame;
@property (retain,nonatomic) UITableView *interTable;

@end



@implementation YKProductViewCellSingle

@end
@implementation YKProductViewCellTwo

@end

@implementation YKProductListView
@synthesize interTable = _interTable;
@synthesize orgFrame = _orgFrame;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _orgFrame = frame;
        [self reloadData];
    }
    return self;
}

-(void) reloadData{
    [self.interTable reloadData];
}
- (UITableView*)interTable{
    if (!_interTable) {
        _interTable = [[UITableView alloc] initWithFrame:_orgFrame style:UITableViewStylePlain] ;
        _interTable.dataSource = self;
        _interTable.delegate = self;
        _interTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_interTable];
    }
    return _interTable;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.dataSource productListType]==YKProductListTypeSingle)
    return 97;
    else{
        return 135;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int ret = 0;
    int chushu = (int)[self.dataSource productListType];
//    assert(chushu!=0);
    ret = ceilf((CGFloat)[self.dataSource numberOfItems]/chushu);
    return ret;
}
- (void)buttonAction:(UIButton*)sender{
    [self.delegate productListView:self didSelectIndex:sender.tag];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *idfiTwo = @"YKTableViewCellForProductListTwo";
    static NSString *idfiSingle = @"YKTableViewCellForProductListSingle";

    
    if ([self.dataSource productListType]==YKProductListTypeTwo) {
        YKProductViewCellTwo *cell = [tableView dequeueReusableCellWithIdentifier:idfiTwo];
        if (!cell) {
            cell = [YKXIBHelper loadObjectFromXIBName:@"YKProductCell" type:[YKProductViewCellTwo class]];
            [cell.leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        int row = indexPath.row;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftImageView.image =[UIImage imageNamed:[self.dataSource imageUrlForIndex:row*2]];
        cell.leftNameLabel.text = [self.dataSource productNameForIndex:row*2];
        cell.leftSalePriceLabel.text = [self.dataSource salePriceForIndex:row*2];
        cell.leftButton.tag = row*2;
        if (row*2+1>=[self.dataSource numberOfItems]) {
            cell.rightImageView.hidden = YES;
            cell.rightNameLabel.hidden = YES;
            cell.rightSalePriceLabel.hidden = YES;
            cell.rightButton.hidden = YES;
        }else{
            cell.rightImageView.hidden = NO;
            cell.rightSalePriceLabel.hidden = NO;
            cell.rightNameLabel.hidden = NO;
            cell.rightButton.tag = row*2+1;
            cell.rightButton.hidden = NO;
            cell.rightNameLabel.text = [self.dataSource productNameForIndex:row*2+1];
            cell.rightSalePriceLabel.text = [self.dataSource salePriceForIndex:row*2+1];
            cell.rightImageView.image = [UIImage imageNamed:[self.dataSource imageUrlForIndex:row*2+1]];
        }
        return cell;

    }else{
        YKProductViewCellSingle *cell = [tableView dequeueReusableCellWithIdentifier:idfiSingle];
        if (!cell) {
            cell = [YKXIBHelper loadObjectFromXIBName:@"YKProductCell" type:[YKProductViewCellSingle class]];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        int row = indexPath.row;
        cell.imageView.image= [UIImage imageNamed:[self.dataSource imageUrlForIndex:row]];
        cell.nameLabel.text = [self.dataSource productNameForIndex:row];
        cell.salePriceLabel.text = [self.dataSource salePriceForIndex:row];
        cell.shopPriceLabel.text = [self.dataSource shopPriceForIndex:row];
        return cell;
    }
    assert(0);

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.dataSource productListType]==YKProductListTypeSingle) {
        [self.delegate productListView:self didSelectIndex:indexPath.row];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self reloadData];
}

@end

@implementation YKLineLabel
float getTextSizeWidth(NSString*text ,float aFontSize) {
    //    float width = 0;
    NSString *platFormstr = text;
    CGSize platFormconstraint = CGSizeMake(10000, 10000);
    CGSize platFormsize =[platFormstr sizeWithFont:[UIFont systemFontOfSize:aFontSize] constrainedToSize:platFormconstraint lineBreakMode: NSLineBreakByCharWrapping ];
    //    width = platFormsize.width;
    //    return width;
    return platFormsize.width;
}
- (void)drawRect:(CGRect)rect{
    float width =  getTextSizeWidth(self.text, 14);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [self.textColor CGColor]);
    CGFloat x = 0;
    CGFloat y = rect.size.height/2;
    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, width, y);
    CGContextStrokePath(context);
    [super drawRect:rect];
}

@end

