//
//  CategoryView.h
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-23.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
-(void)setbookImageValue:(NSString *)imageName;
@end
