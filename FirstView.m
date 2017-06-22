#import "FirstView.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
@implementation FirstView

@synthesize bar = _bar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    UIImageView *imagev = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1backimage"]];
    imagev.frame = CGRectMake(0, 0, 320, 568);
    [self.view addSubview:imagev];
    /* ---------------------------------------------------------
     * Create images that are used for the main button
     * -------------------------------------------------------*/
    UIImage *image = [UIImage imageNamed:@"按钮点之前.png"];
    UIImage *selectedImage = [UIImage imageNamed:@"按钮点之前.png"];
    UIImage *toggledImage = [UIImage imageNamed:@"按钮点之后.png"];
    UIImage *toggledSelectedImage = [UIImage imageNamed:@"按钮点之后.png"];
    
    /* ---------------------------------------------------------
     * Create the center for the main button and origin of animations
     * -------------------------------------------------------*/
    CGPoint center = CGPointMake(60.0f, 470.0f);
    
    /* ---------------------------------------------------------
     * Setup buttons
     * Note: I am setting the frame to the size of my images
     * -------------------------------------------------------*/
    CGRect buttonFrame = CGRectMake(0, 0, 43.0f, 43.0f);
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b1 setFrame:buttonFrame];
    [b1 setImage:[UIImage imageNamed:@"home-1@2x.png"] forState:UIControlStateNormal];
    [b1 setImage:[UIImage imageNamed:@"home-1-副本@2x.png"] forState:UIControlStateHighlighted];
    [b1 addTarget:self action:@selector(toOne) forControlEvents:UIControlEventTouchUpInside];
    UIButton *b2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b2 setImage:[UIImage imageNamed:@"home-2@2x.png"] forState:UIControlStateNormal];
    [b2 setImage:[UIImage imageNamed:@"home-2-副本@2x.png"] forState:UIControlStateHighlighted];
    [b2 setFrame:buttonFrame];
    [b2 addTarget:self action:@selector(toTwo) forControlEvents:UIControlEventTouchUpInside];
    UIButton *b3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b3 setImage:[UIImage imageNamed:@"home-3@2x.png"] forState:UIControlStateNormal];
    [b3 setImage:[UIImage imageNamed:@"home-3-副本@2x.png"] forState:UIControlStateHighlighted];
    [b3 setFrame:buttonFrame];
    [b3 addTarget:self action:@selector(toThree) forControlEvents:UIControlEventTouchUpInside];
    UIButton *b4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b4 setImage:[UIImage imageNamed:@"home-4@2x.png"] forState:UIControlStateNormal];
    [b4 setImage:[UIImage imageNamed:@"home-4-副本@2x.png"] forState:UIControlStateHighlighted];
    [b4 setFrame:buttonFrame];
    [b4 addTarget:self action:@selector(toFour) forControlEvents:UIControlEventTouchUpInside];
    NSArray *buttons = [NSArray arrayWithObjects:b1, b2, b3,b4, nil];
    
    /* ---------------------------------------------------------
     * Init method, passing everything the bar needs to work
     * -------------------------------------------------------*/
    RNExpandingButtonBar *bar = [[RNExpandingButtonBar alloc] initWithImage:image selectedImage:selectedImage toggledImage:toggledImage toggledSelectedImage:toggledSelectedImage buttons:buttons center:center];
    
    /* ---------------------------------------------------------
     * Settings
     * -------------------------------------------------------*/
    [bar setDelegate:self];
    [bar setSpin:YES];
    
    /* ---------------------------------------------------------
     * Set our property and add it to the view
     * -------------------------------------------------------*/
    [self setBar:bar];
    [[self view] addSubview:[self bar]];
    
    [[self navigationController] setToolbarHidden:YES];
    [[self navigationController] setNavigationBarHidden:NO];
}
-(void)toOne
{
    OneViewController *one = [[OneViewController alloc]initWithNibName:@"OneViewController" bundle:nil];
    [self.navigationController pushViewController:one animated:YES];
}
-(void)toTwo
{
    TwoViewController *one = [[TwoViewController alloc]initWithNibName:@"TwoViewController" bundle:nil];
    [self.navigationController pushViewController:one animated:YES];
}
-(void)toThree
{
    ThreeViewController *one = [[ThreeViewController alloc]initWithNibName:@"ThreeViewController" bundle:nil];
    [self.navigationController pushViewController:one animated:YES];
}
-(void)toFour
{
    FourViewController *one = [[FourViewController alloc]initWithNibName:@"FourViewController" bundle:nil];
    [self.navigationController pushViewController:one animated:YES];
}

/* ---------------------------------------------------------
 * Delegate methods of ExpandingButtonBarDelegate
 * -------------------------------------------------------*/
- (void) expandingBarDidAppear:(RNExpandingButtonBar *)bar
{
    NSLog(@"did appear");
}

- (void) expandingBarWillAppear:(RNExpandingButtonBar *)bar
{
    NSLog(@"will appear");
}

- (void) expandingBarDidDisappear:(RNExpandingButtonBar *)bar
{
    NSLog(@"did disappear");
}

- (void) expandingBarWillDisappear:(RNExpandingButtonBar *)bar
{
    NSLog(@"will disappear");
}

@end
