//
//  YKLineView.m
//  line
//
//  Created by yanguo.sun on 13-4-8.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKLineView.h"

@implementation YKLineView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
        CGContextRef context =UIGraphicsGetCurrentContext();
        CGContextBeginPath(context);
        CGContextSetLineWidth(context,1.0);
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        float lengths[] = {2,2};
        CGContextSetLineDash(context, 0, lengths,2);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 320,0);
        CGContextStrokePath(context);
        [super drawRect:rect];
        
    // Drawing code
}

@end
