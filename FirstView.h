#import <UIKit/UIKit.h>
#import "RNExpandingButtonBar.h"

@interface FirstView : UIViewController
<RNExpandingButtonBarDelegate>
{
    RNExpandingButtonBar *_bar;
}

@property (nonatomic, strong) RNExpandingButtonBar *bar;

@end
