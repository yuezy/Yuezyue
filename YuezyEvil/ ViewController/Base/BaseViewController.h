#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "MBProgressHUD.h"
@interface BaseViewController : UIViewController

- (void)showLoadingView;

- (void)showLoading:(NSString *)msg;

- (void)hideLoadingView;

- (void)setNavTitle:(NSString *)title;

- (void)setNavTitleView:(NSString *)imageName;

- (void)setNavBackgroundImage:(NSString *)name;

- (void)setBackgroundImageColor:(NSString *)imageName;

- (UIView *)setBackgroundView:(NSString *)imageName;

- (void)setBackButton;

- (void)setLeftButton:(NSString *)title;

- (void)setLeftButton:(NSString *)title withImage:(NSString *)imgName;

- (void)setRightButton:(NSString *)title;

- (void)setRightButton:(NSString *)title withImage:(NSString *)imgName;

- (void)backToRootViewController;

- (void)onLeftButton:(id)sender;

- (void)onRightButton:(id)sender;

- (void)setLeftButtonAsBack;

- (void)toast:(NSString *)tip;

- (UINavigationController *)presentNavigationController:(UIViewController *)controller
                                               animated:(BOOL)flag
                                             completion:(void (^)(void))completion;

- (UINavigationController *)presentModalNavigationController:(UIViewController *)viewControllerToPresent
                                                    animated:(BOOL)flag
                                                  completion:(void (^)(void))completion;

@end

