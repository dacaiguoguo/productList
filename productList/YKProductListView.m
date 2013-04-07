//
//  YKProductListView.m
//  productList
//
//  Created by  YK on 13-4-7.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKProductListView.h"
#import "YKXIBHelper.h"

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
        [self addSubview:_interTable];
    }
    return _interTable;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *idfiTwo = @"YKTableViewCellForProductListTwo";
    static NSString *idfiSingle = @"YKTableViewCellForProductListSingle";

    
    if ([self.dataSource productListType]==YKProductListTypeTwo) {
        YKProductViewCellTwo *cell = [tableView dequeueReusableCellWithIdentifier:idfiTwo];
        if (!cell) {
            cell = [YKXIBHelper loadObjectFromXIBName:@"YKProductCell" type:[YKProductViewCellTwo class]];
        }
        int row = indexPath.row;
        
        cell.leftImageView.image =[UIImage imageNamed:[self.dataSource imageUrlForIndex:row*2]];
        cell.leftNameLabel.text = [self.dataSource productNameForIndex:row*2];
        cell.leftSalePriceLabel.text = [self.dataSource salePriceForIndex:row*2];
        if (row*2+1>=[self.dataSource numberOfItems]) {
            cell.rightImageView.hidden = YES;
        }else{
            cell.hidden = NO;
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
        int row = indexPath.row;
        cell.imageView.image= [UIImage imageNamed:[self.dataSource imageUrlForIndex:row]];
        cell.nameLabel.text = [self.dataSource productNameForIndex:row];
        cell.salePriceLabel.text = [self.dataSource salePriceForIndex:row];
        cell.shopPriceLabel.text = [self.dataSource shopPriceForIndex:row];
        return cell;
    }
    assert(0);
    
    
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idfi];
//        int width = self.bounds.size.width/[self.dataSource productListType];
//   
//    }
//    UIView *list = [self.dataSource cellViewModel];
//    assert(list);
//    assert([list isKindOfClass:[YKDataMoudleList class] ]);
//    for (int i=0; i<self.numberOfColumn; ++i) {
//        UIButton *formB = (UIButton *)[cell viewWithTag:2013+i];
//        int getN = indexPath.row*self.numberOfColumn+i;
//        if (getN>=list.subArray.count) {
//            formB.hidden = YES;
//        }else{
//            formB.hidden = NO;
//            assert([formB isKindOfClass:[UIButton class]]);
//            [formB setTitle:list.subArray[getN] forState:UIControlStateNormal];
//        }
//    }

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self reloadData];
}

@end
