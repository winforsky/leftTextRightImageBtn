#import "WCNButton+AssociatedObject.h"


#import <objc/runtime.h>

@implementation WCNButton (AssociatedObject)

@dynamic associatedObject;

- (void)setAssociatedObject:(id)object
{
    objc_setAssociatedObject(self, @selector(associatedObject), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([object intValue] == 0) {
        [self setImage:[UIImage imageNamed:@"price_drop_ico"]
              forState:UIControlStateNormal];
        
    }else{
        [self setImage:[UIImage imageNamed:@"price_rise_ico"]
              forState:UIControlStateNormal];
    }
}

- (id)associatedObject
{
    return objc_getAssociatedObject(self, @selector(associatedObject));
}
@end
