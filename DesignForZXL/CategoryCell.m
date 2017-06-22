//
//  CategoryCell.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-23.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    UIFont *font = [UIFont fontWithName:@"Dekar" size:17];
    self.bookTitle.font = font;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
