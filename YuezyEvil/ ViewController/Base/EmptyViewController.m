#import "BaseNavigationViewController.h"
#import "EmptyViewController.h"
#import "CommonHeader.h"
@interface EmptyViewController (){
    MBProgressHUD *HUD;
}

@end

@implementation EmptyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    if (IOS_VERSION_MIN_REQUIRED_7) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#F0F6F7"]];
    } else {
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithHexString:@"#F0F6F7"]];
    }
    
    CGRect frame = CGRectMake(0.0, 0.0, kDeviceWidth, kDeviceHeight);
    self.view = [[UIView alloc] initWithFrame:frame];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F0F6F7"];
    self.view.frame = frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma mark - showLoadingView
- (void)showLoadingView
{
    [self showLoading:@"正在加载..."];
}

- (void)showLoading:(NSString *)msg
{
    // Create HUD
    if (!HUD) {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
    }
    
    HUD.labelText = msg;
    [HUD show:YES];
}

#pragma mark - hideLoadingView
- (void)hideLoadingView
{
    if (HUD) {
        [HUD hide:YES afterDelay:0.5];;
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIView *)setBackgroundView:(NSString *)imageName
{
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    return bgImageView;
}

- (void)setBackgroundImageColor:(NSString *)imageName
{
    /*
     ATTENTION!
     Don't call method 'colorWithPatternImage' under ARC. Cause it use a lot of memory.
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imagename]];
     */
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    bgImageView.userInteractionEnabled = YES;
    self.view = bgImageView;
}

- (void)toast:(NSString *)tip
{
    [self.view makeToast:tip
                duration:1.5
                position:@"bottom"];
}

#pragma mark - backToRootViewController
- (void)backToRootViewController
{
    UITabBarController *tabBarViewController = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    
    [tabBarViewController setSelectedViewController:[tabBarViewController.viewControllers objectAtIndex:0]];
    
    BaseNavigationViewController *nav = (BaseNavigationViewController *)[tabBarViewController.viewControllers objectAtIndex:0];
    
    UIViewController *vc = nav.visibleViewController;
    
    LOG(@"topViewController = %@, visibleViewController = %@, presentingViewController = %@, presentedViewController = %@", nav.topViewController, nav.visibleViewController, vc.presentingViewController, vc.presentedViewController);
    
    if (vc.presentingViewController) {
        [vc dismissViewControllerAnimated:NO completion:^{
            [self backToRootViewController];
        }];
    }
    
    if (vc.presentedViewController)  {
        [vc dismissViewControllerAnimated:NO completion:^{
            [self backToRootViewController];
        }];
    }
}

#pragma mark - appear/disapper
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
