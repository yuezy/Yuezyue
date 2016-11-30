#import "BaseViewController.h"
#import "BaseNavigationViewController.h"
#import "NavBarButton.h"
#import "MBProgressHUD.h"
#import "CommonHeader.h"
@interface BaseViewController ()<UIAlertViewDelegate>{
    MBProgressHUD *HUD;
    UITextField *alertInput;
}

@end


@implementation BaseViewController

+ (void)initialize
{
    if (IOS_VERSION_MIN_REQUIRED_7) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#DF2F37"]]; // ec6a00
    } else {
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithHexString:@"#DF2F37"]];
    }
    //去掉 NavigationBar 下面的黑线
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    CGRect frame = CGRectMake(0.0, 0.0, kDeviceWidth, kDeviceHeight);
    self.view = [[UIView alloc] initWithFrame:frame];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F0F6F7"];
    self.view.frame = frame;
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
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
        [HUD hide:YES afterDelay:0.25];
        [HUD removeFromSuperViewOnHide];
        HUD = nil;
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

- (void)setNavTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kNavButtonWidth4Letter, 0.0, kDeviceWidth - 2 * kNavButtonWidth4Letter, kNavigationBarHeight)];
    titleLabel.text = title;
    titleLabel.font = kSTHeitiSC_20;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 1;
    titleLabel.adjustsFontSizeToFitWidth = YES; // 目前支持自适应（标题比较长），如需要可改成自动滚动效果
    titleLabel.minimumScaleFactor = 17.0f;
    titleLabel.backgroundColor = [UIColor clearColor];
#if 0
    // 实现阴影效果
    UIColor *color = [[UIColor alloc] initWithWhite:0.3 alpha:0.5];
    titleLabel.shadowColor = color;
    titleLabel.shadowOffset = CGSizeMake(0.0, -1.0);
#endif
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - setNavTitleView:
- (void)setNavTitleView:(NSString *)imageName
{
    if (imageName && imageName.length > 0) {
        UIImageView *logoImage = [[UIImageView alloc] init];
        [logoImage setImage:[UIImage imageNamed:imageName]];
        [logoImage setFrame:CGRectMake(kNavButtonWidth4Letter, 0.0f, logoImage.image.size.width, logoImage.image.size.height)];
        self.navigationItem.titleView = logoImage;
    } else {
        self.navigationItem.titleView = nil;
    }
}

#pragma mark - IBFlexButton
- (void)setBackButton
{
    NavBarButton *backButton = [NavBarButton createBackButton];
    //    backButton.backgroundColor = [UIColor orangeColor];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *leftButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if (IOS_VERSION >= 7.0) {
        //        leftButtonSpace.width = -8.0; // -15.0
    } else {
        leftButtonSpace.width = -5.0;
    }
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftButtonSpace, leftBarButtonItem, nil];
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(onLeftButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLeftButton:(NSString *)title
{
    if (self.navigationItem.leftBarButtonItems) {
        return;
    }
    NavBarButton *leftButton = [NavBarButton createLeftButton:title];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *leftButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if (IOS_VERSION >= 7.0) {
        leftButtonSpace.width = -8.0;
    } else {
        leftButtonSpace.width = -5.0;
    }
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftButtonSpace, leftBarButtonItem, nil];
    [leftButton addTarget:self action:@selector(onLeftButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLeftButton:(NSString *)title withImage:(NSString *)imgName
{
    NavBarButton *leftButton = [NavBarButton createLeftButton:title withImage:imgName];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *leftButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if (IOS_VERSION >= 7.0) {
        leftButtonSpace.width = -8.0;
    } else {
        leftButtonSpace.width = -5.0;
    }
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftButtonSpace, leftBarButtonItem, nil];
    [leftButton addTarget:self action:@selector(onLeftButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setRightButton:(NSString *)title
{
    NavBarButton *rightButton = [NavBarButton createRightButton:title];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    UIBarButtonItem *rightButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if (IOS_VERSION >= 7.0) {
        rightButtonSpace.width = -8.0;
    } else {
        rightButtonSpace.width = -5.0;
    }
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightButtonSpace, rightBarButtonItem, nil];
    [rightButton addTarget:self action:@selector(onRightButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setRightButton:(NSString *)title withImage:(NSString *)imgName
{
    NavBarButton *rightButton = [NavBarButton createRightButton:title withImage:imgName];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    UIBarButtonItem *rightButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if (IOS_VERSION >= 7.0) {
        rightButtonSpace.width = -8.0;
    } else {
        rightButtonSpace.width = -5.0;
    }
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightButtonSpace, rightBarButtonItem, nil];
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(onRightButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLeftButtonAsBack
{
    NavBarButton *backButton = [NavBarButton createBackButton];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(onLeftButton:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - button selector

- (void)onLeftButton:(id)sender
{
    //implamentation in subclass
    [self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)onRightButton:(id)sender
{
    //implamentation in subclass
}

#pragma mark - setNavBackgroundColor
- (void)setNavBackgroundColor
{
    //    self.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:@"f8f6f1"];
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_bartop.png"]forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)setNavBackgroundImage:(NSString *)name
{
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:name]forBarMetrics:UIBarMetricsDefault];
    } else {
        //        self.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:@"f8f6f1"];
        self.navigationController.navigationBar.layer.contents = (id)[UIImage imageNamed:name].CGImage;
    }
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
                position:@"CSToastPositionBottom"]; //
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

- (UINavigationController *)presentNavigationController:(UIViewController *)controller
                                               animated:(BOOL)flag
                                             completion:(void (^)(void))completion
{
    BaseNavigationViewController *navigationController = [[BaseNavigationViewController alloc] initWithRootViewController:controller];
    
    navigationController.modalTransitionStyle = controller.modalTransitionStyle;
    
#if (_TARGET_VERSION < 32)
    if ([navigationController respondsToSelector:@selector(setModalPresentationStyle:)])
#endif
    {
        navigationController.modalPresentationStyle = controller.modalPresentationStyle;
    }
    
    [self presentViewController:navigationController animated:flag completion:completion];
    return navigationController;
}

- (UINavigationController *)presentModalNavigationController:(UIViewController *)viewControllerToPresent
                                                    animated:(BOOL)flag
                                                  completion:(void (^)(void))completion
{
    NavBarButton *leftButton = [NavBarButton createBackButton];
    [leftButton addTarget:self action:@selector(dismissViewControllerAnimated:completion:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *leftButtonSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if (IOS_VERSION >= 7.0) {
        //        leftButtonSpace.width = -15.0;
    } else {
        leftButtonSpace.width = -5.0;
    }
    viewControllerToPresent.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftButtonSpace, leftBarButtonItem, nil];
    //    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    //    viewControllerToPresent.navigationItem.leftBarButtonItem = doneButton;
    return [self presentNavigationController:viewControllerToPresent animated:flag completion:completion];
}



-(void)dealloc{
    [self hideLoadingView];
}
@end
