#import <UIKit/UIKit.h>

@interface EmptyViewController : UIViewController

- (void)showLoadingView;

- (void)showLoading:(NSString *)msg;

- (void)hideLoadingView;

- (UIView *)setBackgroundView:(NSString *)imageName;

- (void)setBackgroundImageColor:(NSString *)imageName;

- (void)toast:(NSString *)tip;

- (void)backToRootViewController;

@end
