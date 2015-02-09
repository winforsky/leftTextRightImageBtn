#import "UIViewController+WCNViewControllerUtil.h"

@implementation UIViewController (WCNViewControllerUtil)


/**
 *  在当前ViewController上弹出透明的ViewController
 */
- (void)toProVC:(UIViewController*)propVC
{
   
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=8.0) {
        propVC.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }else{
        propVC.modalPresentationStyle=UIModalPresentationCurrentContext;
    }
    
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    UIWindow *curWindow = [UIApplication sharedApplication].windows[0];
    [curWindow.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    
    
    [self presentViewController:propVC animated:YES completion:^{
        propVC.view.backgroundColor=[UIColor colorWithPatternImage:viewImage];
    }];
}

@end
