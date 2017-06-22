//
//  ThreeInforHeaderView.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-28.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "ThreeInforHeaderView.h"

@implementation ThreeInforHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)setNameAndDistance:(NSString *)name And:(NSString *)disctanceString
{
    UIFont *font = [UIFont fontWithName:@"Dekar" size:12];
    self.nameLabel.font = font;
    self.distanceLabel.font = font;
    self.nameLabel.text = name;
    self.distanceLabel.text = disctanceString;
}
@end
