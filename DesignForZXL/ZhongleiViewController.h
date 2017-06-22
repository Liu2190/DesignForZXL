//
//  ZhongleiViewController.h
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-24.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhongleiViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backAction:(id)sender;
@property (nonatomic,assign)int num;
@end
