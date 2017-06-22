//
//  ThreeCell.h
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-28.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
-(void)setCellValueWith:(NSString *)name And:(NSString *)image;
@end
