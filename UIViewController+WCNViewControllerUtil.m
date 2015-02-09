#import "UIViewController+WCNViewControllerUtil.h"

@implementation UIViewController (WCNViewControllerUtil)


/**
 *  在当前ViewController上弹出透明的ViewController
 */
- (void)toProVC:(UIViewController*)propVC
{
    propVC.view.backgroundColor=[UIColor clearColor];
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=8.0) {
        propVC.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }else{
        propVC.modalPresentationStyle=UIModalPresentationCurrentContext;
    }
    
    [self presentViewController:propVC animated:YES completion:^{
        //网上搜索的部分资料说需要，本人测试不需要可以实现相关功能，请根据需要进行设置
        //propVC.view.superview.backgroundColor=[UIColor clearColor];
    }];
}

@end
