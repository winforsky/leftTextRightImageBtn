#import <UIKit/UIKit.h>

@protocol WCNTypeViewDelegate <NSObject>

@optional
-(void)clickedChanged:(NSIndexPath*)indexPath;

@end

@interface WCNTypeView : UIView

- (id)initWithFrame:(CGRect)frame andData:(NSArray*)titles andBgImage:(UIImage*)bgImage andSelectedBgImage:(UIImage*)bgSelectedImage;

@property(nonatomic, weak)id<WCNTypeViewDelegate> delegate;
@property(nonatomic, strong)UIImage *bgImage;
@property(nonatomic, strong)UIImage *bgSelectedImage;

@end
