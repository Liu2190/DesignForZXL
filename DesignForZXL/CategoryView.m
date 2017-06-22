//
//  CategoryView.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-23.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "CategoryView.h"

@implementation CategoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setbookImageValue:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    self.bookImage.image = image;
    self.bookImage.center = CGPointMake(41, 49);
    CGSize size = image.size;
    CGRect rect = self.bookImage.frame;
    rect.size = size;
    self.bookImage.frame = rect;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
