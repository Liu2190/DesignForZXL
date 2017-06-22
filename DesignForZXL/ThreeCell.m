//
//  ThreeCell.m
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-28.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "ThreeCell.h"

@implementation ThreeCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellValueWith:(NSString *)name And:(NSString *)image;
{
    self.bookImage.image = [UIImage imageNamed:image];
    self.bookName.text = name;
    UIFont *font = [UIFont fontWithName:@"Dekar" size:17];
    self.bookName.font = font;
}
@end
