//
//  ThreeInforHeaderView.h
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-28.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeInforHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
-(void)setNameAndDistance:(NSString *)name And:(NSString *)disctanceString;
@end
