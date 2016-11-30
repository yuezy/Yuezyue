#import "BaseNavigationViewController.h"
#import "CommonHeader.h"


@interface BaseNavigationViewController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}
+(void)initialize
{

    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#DF2F37"]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (IOS_VERSION >=9.0) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }else{
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    }
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#DF2F37"]]; 
    
    self.navigationBar.translucent = NO;
    
    __weak BaseNavigationViewController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.delegate = weakSelf;
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        navigationController.interactivePopGestureRecognizer.enabled = YES;
        
        if (navigationController.viewControllers.count == 1) {
            navigationController.interactivePopGestureRecognizer.enabled = NO;
            navigationController.interactivePopGestureRecognizer.delegate = nil;
        }
    }
}

@end
