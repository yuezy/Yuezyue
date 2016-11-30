

#import "NavBarButton.h"
#import "CommonHeader.h"

@implementation NavBarButton

- (id)initWithTitle:(NSString *)title Width:(CGFloat)width Height:(CGFloat)height ImageNormal:(UIImage *)normalName ImageHighlighted:(UIImage *)HighlightName
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.autoresizesSubviews = YES;
        
        if (title) {
            [self setTitle:title forState:UIControlStateNormal];
//            [self setTitleColor:[UIColor colorWithHexString:@"#9FA0A0"] forState:UIControlStateNormal];
//            [self setTitleColor:[[UIColor colorWithHexString:@"#9FA0A0"] colorWithAlphaComponent:0.75]forState:UIControlStateHighlighted];
            self.titleLabel.font = kSTHeitiSC_16; // kSTHeitiSC_Medium_16;  // kHelveticaNeue_15
        }
        
        if (normalName) {
            [self setBackgroundImage:normalName forState:UIControlStateNormal];
        }
        
        if (HighlightName) {
            [self setBackgroundImage:HighlightName forState:UIControlStateHighlighted];
        }
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.autoresizesSubviews = YES;
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithHexString:@"88837d"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        self.titleLabel.font = kHelveticaNeue_15;
    }
    return self;
}

+ (NavBarButton *)createBackButton
{
    UIImage *normalImage = [UIImage imageNamed:@"back_white"];
    NavBarButton *button = [[NavBarButton alloc] initWithTitle:nil Width:kNavButtonWidth2Letter Height:kNavButtonHeight ImageNormal:normalImage ImageHighlighted:nil]; // @"返回"
    button.frame = CGRectMake(0.0, 0.0, normalImage.size.width, normalImage.size.height);
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 5.0)];kLeftBackButtonImageSize
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter]; // 垂直对齐
//    [button setImageEdgeInsets:UIEdgeInsetsMake((kNavButtonHeight - kLeftBackButtonImageSize.height) / 2, 0.0, (kNavButtonHeight - kLeftBackButtonImageSize.height) / 2, kNavButtonWidth2Letter - kLeftBackButtonImageSize.width)];
    button.showsTouchWhenHighlighted = NO;
    return button;
}

+ (NavBarButton *)createLeftButton:(NSString *)title
{
    CGFloat tempWidth = 0.0;
    if (title.length >= 4) {       // 4个字
        tempWidth = kNavButtonWidth4Letter;
    } else if (title.length == 3) {// 默认3个字
        tempWidth = kNavButtonWidth3Letter;
    } else { // 2个字
        tempWidth = kNavButtonWidth2Letter;
    }
    
    NavBarButton *button = [[NavBarButton alloc] initWithTitle:title Width:tempWidth Height:kNavButtonHeight ImageNormal:[UIImage imageNamed:@"ic_indicator.png"] ImageHighlighted:nil];
    button.frame = CGRectMake(0.0, 0.0, tempWidth, kNavButtonHeight);
    button.backgroundColor = [UIColor clearColor];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -3.0, 0.0, 3.0)];
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter]; // 垂直对齐
    [button setImageEdgeInsets:UIEdgeInsetsMake((kNavButtonHeight - kLeftBackButtonImageSize.height) / 2, 0.0, (kNavButtonHeight - kLeftBackButtonImageSize.height) / 2, kNavButtonWidth2Letter - kLeftBackButtonImageSize.width)];
    button.showsTouchWhenHighlighted = NO;
    return button;
}

+ (NavBarButton *)createLeftButton:(NSString *)title withImage:(NSString *)imgName
{
    CGFloat tempWidth = 0.0;
    UIImage *imgNormal = [UIImage imageNamed:imgName];
    if (title.length >= 4) {       // 4个字
        tempWidth = kNavButtonWidth4Letter;
    } else if (title.length == 3) {// 默认3个字
        tempWidth = kNavButtonWidth3Letter;
    } else { // 2个字
        tempWidth = kNavButtonWidth2Letter;
    }
    
    NavBarButton *button = [[NavBarButton alloc] initWithTitle:title Width:tempWidth Height:kNavButtonHeight ImageNormal:imgNormal ImageHighlighted:nil];
    button.frame = CGRectMake(0.0, 0.0, tempWidth, kNavButtonHeight);
    
    if (title && [title length] > 0 && imgName && [imgName length] > 0) {
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 5.0)];
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [button setImageEdgeInsets:UIEdgeInsetsMake((kNavButtonHeight - imgNormal.size.height) / 2, 5.0, (kNavButtonHeight - imgNormal.size.height) / 2, tempWidth - imgNormal.size.width)];
    } else if (imgName && [imgName length] > 0) {
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [button setImageEdgeInsets:UIEdgeInsetsMake((kNavButtonHeight - imgNormal.size.height) / 2, 3.0 + (tempWidth - imgNormal.size.width) / 2, (kNavButtonHeight - imgNormal.size.height) / 2, (tempWidth - imgNormal.size.width) / 2 - 3.0)];
    } else if (title && [title length] > 0) {
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 5.0)];
        [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    }
    
    button.showsTouchWhenHighlighted = NO;
    return button;
}

+ (NavBarButton *)createRightButton:(NSString *)title
{
    CGFloat tempWidth = 0.0;
    if (title.length >= 4) {       // 4个字
        tempWidth = kNavButtonWidth4Letter;
    } else if (title.length == 3) {// 默认3个字
        tempWidth = kNavButtonWidth3Letter; // 60
    } else { // 2个字
        tempWidth = kNavButtonWidth2Letter;
    }
    
    NavBarButton *button = [[NavBarButton alloc] initWithTitle:title Width:tempWidth Height:kNavButtonHeight ImageNormal:[UIImage imageNamed:@"back_arrow.png"] ImageHighlighted:nil];
    button.frame = CGRectMake(0.0, 0.0, tempWidth, kNavButtonHeight);
    button.backgroundColor = [UIColor clearColor];
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter]; // 垂直对齐
//    [button setImageEdgeInsets:UIEdgeInsetsMake(8.0, tempWidth - 13.0, 8.0, 5.0)];
    button.showsTouchWhenHighlighted = NO;
    return button;
}

+ (NavBarButton *)createRightButton:(NSString *)title withImage:(NSString *)imgName
{
    CGFloat tempWidth = 0.0;
    UIImage *imgNormal = [UIImage imageNamed:imgName];
    
    if (title.length >= 4) {       // 4个字
        tempWidth = kNavButtonWidth4Letter;
    } else if (title.length == 3) {// 默认3个字
        tempWidth = kNavButtonWidth3Letter;
    } else { // 2个字
        tempWidth = imgNormal.size.width; // kNavButtonWidth2Letter;
    }
    
    NavBarButton *button = [[NavBarButton alloc] initWithTitle:title Width:tempWidth Height:kNavButtonHeight ImageNormal:imgNormal ImageHighlighted:nil];
    button.frame = CGRectMake(0.0, 0.0, tempWidth, imgNormal.size.height);
    button.backgroundColor = [UIColor clearColor];
    button.showsTouchWhenHighlighted = NO;
    return button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

