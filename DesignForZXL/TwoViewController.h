//
//  TwoViewController.h
//  DesignForZXL
//
//  Created by liuxiaodan on 14-4-22.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *xinpinButton;
@property (weak, nonatomic) IBOutlet UIButton *zhongleiButton;
@property (weak, nonatomic) IBOutlet UIImageView *backVie;
@property (weak, nonatomic) IBOutlet UIImageView *lineImage;
@property (weak, nonatomic) IBOutlet UIButton *houtuiButton;
- (IBAction)xinpinAction:(id)sender;
- (IBAction)zhongleiAction:(id)sender;
- (IBAction)backAction:(id)sender;

@end
